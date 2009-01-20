require 'rubygems'
require 'facets' 

module Configurable

  def self.included(base)

    class << base
      attr_reader :configs
      include Enumerable
      def method_missing(name, *args, &block)
        @configs ||= {}
        @configs.send(name, *args, &block)
      end
    end

  private
    # based on http://eigenclass.org/hiki.rb?ruby+plugins
    def base.config_attr(reader, writer, *names, &block)
      class_eval do
        names.each do |name|

          define_method(name) do |*args|
            if args.empty?
              if reader
                instance_variable_get("@#{name}")
              else
                super # should raise the error
              end
            else
              if block_given?
                instance_exec(*args, &block)
              else
                instance_variable_set("@#{name}", *args)
              end
            end
          end

          if writer
            attr_writer name.to_sym
          end

        end
      end
    end

    def base.config_accessor(*names, &block)
      config_attr(true, true, *names, &block)
    end

    def base.config_writer(*names, &block)
      config_attr(false, true, *names, &block)
    end

    def base.config_reader(*names, &block)
      config_attr(true, false, *names, &block)
    end

    def base.config_attribute(*names, &block)
      config_attr(false, false, *names, &block)
    end

    def base.configure(key, *args, &block)
      # arity isn't reliable, so just try it
      begin
        instance = self.new(key, *args)
      rescue ArgumentError
        instance = self.new(*args)
      end
      instance.instance_eval &block
      self[key] = instance
      instance
    end

  end # self.included

end

