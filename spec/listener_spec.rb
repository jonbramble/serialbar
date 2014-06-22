require 'spec_helper'

#dummy class
class Listener
	include Serialbox::Listener
end

RSpec.describe Listener do
	it_behaves_like Serialbox::Listener
end