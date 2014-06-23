require 'thor'

module Serialbox

	class CLI < Thor
		include Thor::Actions

		default_task :usage

		def self.source_root
    		File.dirname(__FILE__)
  		end

  		option :adapter, aliases: "-d", desc: "set the adapter type", required: true	
		desc "new NAME", "create a new serialbox project"
  		def new(name)
    		say "creating a new serialbox project #{name}", :green
    		# create the directory and the classes but will need some kind of config options 
    		readme(name)

    		case options[:adapter]
    			when "mongoid"
    				say 'Using mongoid adapter', :green
    				insert_mongoid(name)

    		end

  		end

  		desc "help", "serialbox help"
  		def usage
  			puts <<-DES
Usage: Serialbox help [command]

Description:  A simple app to create a database or file based storage adapter for serial port data

  			DES
  			help
  		end


  		no_commands do
 			def readme(name)
  				#create readme file and insert the contents
  				str = "text to read"
  				copy_file "generators/README", "#{name}/README"
  				#insert_into_file "#{name}/README", str
  			end

  			def insert_mongoid(name)
  				copy_file "generators/mongoid.yml", "#{name}/mongoid.yml"
  				#append instructions to readme
  			end

  			#when developed
  			def insert_file_system
  				#append instructions to readme
  			end
  		end


  	end
end