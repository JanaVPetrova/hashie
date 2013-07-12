class Hashie::Clash < Hash

  def initialize
    @current_key
  end

  def method_missing(method, args = {}, &block)
  	if method.to_s == "_end!"
      @current_key = nil
    elsif method =~/\!$/
      @current_key = method.to_s.chomp("!").to_sym
    else
  	  @current_key = method
      insert_value(method, args)
    end
    #raise self.inspect
    self
  end
  
  def insert_value(key, value)
    #if @current_key.nil?
    #  self[key] ||= value
    if self[@current_key].nil?
      self[@current_key] = value
    else
      self[@current_key].merge!({key => value})
    end
  end

  def respond_to_missing?(name, include_private = false)
    true
  end

end