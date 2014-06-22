require 'spec_helper'

# dummy classes
class DataFile
	include Serialbox::Adapter
end

class DataThing
	include Serialbox::Adapter
end

RSpec.describe DataFile do
	it_behaves_like Serialbox::Adapter
end

RSpec.describe DataThing do
	it_behaves_like Serialbox::Adapter
end
