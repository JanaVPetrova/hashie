class Hashie::Clash < Hash

  def initialize
    @current_key
  end

  def method_missing(method, args = {}, &block)
    if method.to_s == "_end!"
      @current_key = nil
    elsif method =~ /\!$/  
      @current_key = method.to_s.chomp("!").to_sym
    elsif @current_key.nil?
      insert_first_level(method, args)
    else
      insert_second_level(method, args)
    end
    self
  end
  
  def insert_first_level(key, value)
    if self[key].nil?
      self[key] = value
    else
      self[key].merge! value
    end
  end

  def insert_second_level(key, value)
    if self[@current_key].nil?
      self[@current_key] = {key => value}
    else
      self[@current_key].merge!({key => value})
    end
  end

  def respond_to_missing?(name, include_private = false)
    true
  end

end