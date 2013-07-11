class Hashie::Trash < Hashie::Dash
  class << self
    attr_reader :aliases, :lambdas

    def property(property_name, options = {})
      super

      @aliases ||= {}

      if options.has_key? :from
        @aliases[options[:from]] = property_name

        define_method(:"#{options[:from]}=") do |value|
          self[property_name] = value
        end

        define_method(:"#{options[:from]}") do
          self[property_name]
        end
      end

      @lambdas ||= {}

      if options.has_key? :transform_with
        options[:with] = options[:transform_with]
        options.delete(:transform_with)
      end

      if options.has_key? :with
        @lambdas[property_name] = options[:with]
        define_method(:"#{property_name}=") do |value|
          self[property_name] = self.class.lambdas[property_name].call(value)
        end
      end
    end
  end

  def initialize(args = {})
    @inst_aliases = self.class.aliases
    #@inst_lambdas = self.class.lambdas

    super
  end

  def assert_properties_init!(args)
    args.each do |property, value|
      property = @inst_aliases[property] unless @inst_aliases[property].nil?

      assert_property_required(property, value)
      assert_property_include property

      if @inst_aliases[property]
        @inst_dash[@inst_aliases[property]] = value
      else
        @inst_dash[property] = value
      end
    end
    @inst_defaults.each do |property, value|
      if @inst_dash[property].nil?
        @inst_dash[property] = value
      end
    end
  end
end