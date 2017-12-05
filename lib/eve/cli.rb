#
# EVE CLI
#
require 'gli'
require 'eve/config'
require 'eve/cli/version'
require 'eve/cli/global_options'

module Eve
  module Cli
    include GLI::App
    extend self

    program_desc 'EVE Online Command-line Client (ESI API)'
    version Eve::Cli::VERSION

    subcommand_option_handling :normal
    arguments :strict

    global_options(self)

    pre do |global,command,options,args|
      Eve.configure = global
      ENV['GLI_DEBUG'] = 'true' if global[:trace] == true
      true
    end

    #commands_market(self)
  end
end
