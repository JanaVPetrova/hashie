class Mash
  @hash

  def initialize
    @hash = Hash.new
  end

  def method_missing(method, *args, &block)
    if method =~ /\?$/
      exists?(method)
    elsif method =~ /\=$/
      add(method, args)
    else
      get_value(method)
    end
  end

  def inspect
    self
  end

  private
  def add(key, value)
    key = key.to_s.delete!('=')
    @hash[key] = value.first
  end

  def exists?(key)
    key = key.to_s.delete!('?')
    @hash.has_key?(key)
  end

  def get_value(key)
    @hash[key.to_s]
  end
end