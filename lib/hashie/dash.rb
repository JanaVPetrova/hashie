class Hashie::Dash
  class << self
    attr_reader :properties, :defaults, :requireds

    def property(property_name, options ={})
      @properties ||= []
      @defaults ||= {}
      @requireds ||= []

      @properties << property_name

      if options.has_key? :default
        @defaults[property_name] = options[:default]
      end

      if options.has_key? :required
        @requireds << property_name if options[:required] == true
      end

      define_method(:"#{property_name}=") do |value|
        self[property_name] = value
      end

      define_method(:"#{property_name}") do
        self[property_name]
      end
    end
  end

  def initialize(args = {})
    @inst_properties = self.class.properties
    @inst_defaults = self.class.defaults
    @inst_requireds = self.class.requireds

    @inst_dash = {}

    assert_all_properties_required(args)

    assert_properties_init!(args)
  end

  def raise_argument_error(argument)
    raise ArgumentError, "ArgumentError: #{argument} is required!"
  end

  def raise_no_method_error
    raise NoMethodError, "NoMethodError"
  end

  def assert_property_include(property)
    unless @inst_properties.include? property
      raise_no_method_error
    end
  end

  def assert_property_required(property, value)
    if @inst_requireds.include? property && value.nil?
      raise_argument_error(property)
    end
  end

  def assert_all_properties_required(args)
    @inst_requireds.each do |property| 
      if args[property].nil? && @inst_defaults[property].nil?
        raise_argument_error(property)
      end
    end
  end

  def assert_properties_init!(args)
    args.each do |property, value|
      assert_property_required(property, value)
      assert_property_include property

      @inst_dash[property] = value
    end
    @inst_defaults.each do |property, value|
      if @inst_dash[property].nil?
        @inst_dash[property] = value
      end
    end
  end

  def [](property)
    assert_property_include property

    @inst_dash[property]
  end

  def []=(property, value)
    assert_property_include property
    assert_property_required property, value

    @inst_dash[property] = value
  end
end