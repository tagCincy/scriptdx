require 'scriptdx'
require 'thor'

class Scriptdx::CLI < Thor
  include Thor::Actions

  def self.start(*)
    super
  rescue Exception => e
    raise e
  end

  desc "init", "config sfdx for project"
  def init
    require 'jedi/cli/init'
    invoke Init
  end
end
