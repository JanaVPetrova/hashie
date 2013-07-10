class Hashie::Dash < Hash
  @properties
  @required
  @defaults

  def initialize(properties = {})
    init_properties(properties)
    
    properties.each do |property, value|
      properties[property] = value 
    end if properties
    
    self.class.defaults.each do |key, value|
      self[key] = value
    end

    self.class.required.each do |key, value|
      raise raise_argument_error if self[key].nil?
    end

  end

  def init_properties(properties)
    properties.each_pair do |property, value|
      self[property] = value
    end if properties
  end

  def raise_argument_error
    raise "The property is required"
  end

  def self.required
    @required
  end

  def self.defaults
    @defaults
  end

  def self.property(property_name, options = {})
    init
    
    @properties[property_name] = ""
    
    if options[:required] == true
      @required.push property_name
    end

    unless options[:default].nil?
      @defaults[property_name] = options[:default]
    end

    define_method(:"#{property_name}=") do |value|
      self[property_name] = value
    end

    define_method(:"#{property_name}") do
      self[property_name]
        end
  end

  def self.init
    @properties ||= Hash.new
    @required ||= Array.new
    @defaults ||= Hash.new
  end

  #def has_required_properties?(properties)
  #  @required.each do |required_property|
  #    next if properties.include? required_property
  #    return false
  #  end
  #  true
  #end
end