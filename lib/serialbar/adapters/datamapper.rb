begin
  require 'data_mapper' unless defined?(::DataMapper)
rescue LoadError
  puts "DataMapper is not installed. Please, do '$gem install data_mapper', or add data_mapper to your Gemfile"
end


#sets up the datamapper connection  - will need to copy these files to the new installation
# DataMapper.setup(:default, 'sqlite::memory:')

