require 'thor'

module Serialbox

	class CLI < Thor
		include Thor::Actions

		default_task :usage

		desc "new NAME", "create a new serialbox project"
  		
  		def new(name)
    		puts "creating new project #{name}"
    		# create the directory and the classes but will need some kind of config options 
  		end

  		desc "help", "serialbox help"
  		def usage
  			puts <<-DES
Usage: Serialbox help [command]

Description:  Description goes here
  			DES
  			help
  		end
  	end
end