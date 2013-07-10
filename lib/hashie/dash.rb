class Hashie::Dash
  @properties
  @required
  @defaults

  def initialize(properties = {})
  	#init
  	raise @required.inspect
  	raise_argument_error unless has_required_properties?(properties)
  	properties.each do |property, value|
  	  @properties[property] = value 
  	end
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
  end

  def self.init
  	@properties ||= Hash.new
    @required ||= Array.new
    @defaults ||= Hash.new
  end

  def raise_argument_error
  	raise "The property is required"
  end

  def has_required_properties?(properties)
    @required.each do |required_property|
      next if properties.include? required_property
      return false
    end
    true
  end
end