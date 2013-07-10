class Hashie::Mash
  @hash

  def initialize
    @hash = Hash.new
  end

  def method_missing(method, *args, &block)
    if method =~ /\?$/
      exists?(method)
    elsif method =~ /\=$/
      add(method, args)
    elsif method =~ /\!$/
      add_mash(method)
    else
      get_value(method)
    end
  end

  def inspect
    res = "#{@hash.inspect}"
    res = res.delete(",").delete(">").delete(":").delete("{").delete("}")
    res = " " + res if !res.empty?
    "#{Hashie::Mash.inspect}" + res 
  end

  private
  def add(key, value)
    key = key.to_s.delete!('=').to_sym
    @hash[key] = value.first
  end

  def exists?(key)
    key = key.to_s.delete!('?').to_sym
    @hash.has_key?(key)
  end

  def get_value(key)
    @hash[key.to_sym]
  end

  def add_mash(key)
    key = key.to_s.delete!('!').to_sym
    @hash[key] = Hashie::Mash.new
  end
end