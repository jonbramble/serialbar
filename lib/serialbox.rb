require 'serialbox/data_point'
require 'serialbox/listener'
require 'serialbox/helpers'

# generic adapter didn't work

Mongoid.load!("mongoid.yml", :production) # will need to be able to configure this from the main file

module Serialbox
	# versioning
end
