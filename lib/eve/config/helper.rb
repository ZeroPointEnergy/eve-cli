#
# EVE CLI Config Helper Class
#
require 'etc'

module Eve
  class Config
    module Helper

      def self.included(base)
        base.send(:extend, ClassMethods)
      end

      module ClassMethods

        def user
          Etc.getpwuid(Process.uid)
        end

        def data_dir
          File.join(user.dir, '.eve-cli')
        end

        def conf_var(variable, options = {})
          define_method(variable) do
            unless instance_variable_defined?("@#{variable}")
              default = default.call(self) if default.kind_of?(Proc)
              instance_variable_set "@#{variable}", options[:default]
            end
            instance_variable_get "@#{variable}"
          end
          attr_writer variable
        end

      end

    end
  end
end

