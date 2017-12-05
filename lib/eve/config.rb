#
# EVE CLI Configuration
#
require 'eve/config/helper'

module Eve

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config
  end

  def self.configure=(options_hash)
    options_hash.each do |key, value|
      variable_name = '@' + key.to_s
      if config.instance_variable_defined?( variable_name )
        config.instance_variable_set( variable_name , value )
      end
    end
  end

  class Config
    include Eve::Config::Helper

    conf_var :trace,
      :default => false
    conf_var :data_dir,
      :default => data_dir
  end

end
