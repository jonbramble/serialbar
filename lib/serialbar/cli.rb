require 'thor'
require 'serialbar/generators/boiler_plate'

module Serialbar

	class CLI < Thor
		include Thor::Actions

		default_task :usage

		def self.source_root
    		File.dirname(__FILE__)
  		end

  		desc "list_adapters", "list the currently available adapters"
  		def list_adapters
  			say "Currently available adapters"
  			say "\tmongoid"
  		end

  		option :adapter, aliases: "-d", desc: "set the adapter type", required: true	
		desc "new NAME", "create a new serialbar project"
  		def new(name)
    			say "creating a new serialbar project #{name}", :green 
    			readme(name) # create readme file in project dir

    			case options[:adapter]
    				when "mongoid"
    					say 'Using mongoid adapter', :green
    					insert_mongoid(name)
    					insert_data_file(name,"mongoid")
    				when "datamapper"
    					say 'Using datamapper adapter', :green
    				else 
    					say 'Adapter type unknown', :red
    					invoke :list_adapters
    			end

    			insert_listener(name)
  		end

  		desc "help", "serialbar help"
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
  				#str = "text to read"
  				#copy_file "generators/README", "#{name}/README"
  				#insert_into_file "#{name}/README", str
  			end

  			def insert_mongoid(name)
  				copy_file "generators/mongoid_example.yml", "#{name}/mongoid_example.yml"
  				#append specific instructions to readme
  			end

  			def insert_data_file(name,adapter)
  				create_file "#{name}/data_file.rb" do
  					Serialbar::BoilerPlate.data_file_class
				end

				str = Serialbar::BoilerPlate.config_adapter_string(adapter)
				insert_into_file "#{name}/data_file.rb", str , :after => "include Serialbox::Adapters\n"

  			end

  			def insert_listener(name)
  				create_file "#{name}/listener.rb" do
  					Serialbar::BoilerPlate.listener_class
				end
  			end

  			#when developed
  			def insert_file_system
  				#append instructions to readme
  			end
  		end


  	end
end
