require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/lib/io_adapter.rb'
end
SimpleCov.minimum_coverage 90
