module Serialbox
	module Exceptions
		class NoParseMethodError < NoMethodError; end
		class PortNotInitialized < StandardError; end
	# can we put our customised messages in here?
	end
end
