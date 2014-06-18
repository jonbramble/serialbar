begin
  require 'mongoid' unless defined?(::Mongoid)
rescue LoadError
  puts "Mongoid is not installed. Please, do '$gem install mongoid', or add mongoid to your Gemfile"
end

#sets up the mongoid connection
Mongoid.load!("mongoid.yml", :production)	# will need to be able to configure this from the main file

module Serialbox
  # this will 
  module Adapters
    
    module Mongoid  
      module Document

      end
    end

  end
end
