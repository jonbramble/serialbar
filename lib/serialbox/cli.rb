require 'thor'

module Serialbox

	class CLI < Thor
		include Thor::Actions

		default_task :usage

		def self.source_root
    		File.dirname(__FILE__)
  		end

		desc "new NAME", "create a new serialbox project"	
		method_option :adapter, :aliases => "-d", :desc => "set the adapter"	
  		def new(name)
    		say "creating a new serialbox project #{name}", :green
    		# create the directory and the classes but will need some kind of config options 
    		
    		puts destination_root
    		#copy_file "generators/README", "#{name}/README"
    		#invoke readme(name)
  		end

  		desc "readme NAME", "create a readme file"
  		def readme(name)
  			#create readme file and insert the contents
  			str = "text to read"
  			copy_file "generators/README", "#{name}/README"
  			insert_into_file "#{name}/README", str
  		end

  		desc "help", "serialbox help"
  		def usage
  			puts <<-DES
Usage: Serialbox help [command]

Description:  A simple app to create a database or file based storage adapter for serial port data

  			DES
  			help
  		end


  	end
end