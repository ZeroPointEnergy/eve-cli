#
# EVE CLI gloable options
#
module Eve
  module Cli

    def self.global_options(base)
      base.class_eval do
        desc 'Verbosity of the command line tool'
        default_value 'INFO'
        arg_name 'VERBOSITY'
        flag [:verbosity, :v]

        desc 'Show stacktrace on crash'
        default_value Eve.config.trace
        switch [:trace, :t]

        desc 'Directory for the account info and data cache'
        default_value Eve.config.data_dir
        arg_name 'DATADIR'
        flag [:data_dir, :d]
      end
    end

  end
end

