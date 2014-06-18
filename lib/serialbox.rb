$LOAD_PATH << File.expand_path( File.dirname(__FILE__) +"/../" )

require 'serialbox/adapter'
require 'serialbox/listener'
require 'serialbox/helpers'

require 'mongoid'

Mongoid.load!("mongoid.yml", :production) # will need to be able to configure this from the main file

module Serialbox
	# versioning
end
