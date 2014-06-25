require 'spec_helper'

# dummy classes
class DataFile
	include Serialbar::Adapter
end

class DataThing
	include Serialbar::Adapter
end

RSpec.describe DataFile do
	it_behaves_like Serialbar::Adapter
end

RSpec.describe DataThing do
	it_behaves_like Serialbar::Adapter
end
