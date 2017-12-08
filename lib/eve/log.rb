#
# Logger
#
require 'logger'

module Eve

  def self.log
    @log ||= Logger.new(STDOUT)
  end

end
