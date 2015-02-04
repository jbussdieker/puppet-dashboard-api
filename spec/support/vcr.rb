require 'vcr'

VCR.configure do |c|
  c.default_cassette_options = { :record => :once, :erb => true }
  #c.allow_http_connections_when_no_cassette = true

  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

#RSpec.configure do |c|
#  c.around(:each) do |example|
#    VCR.use_cassette(example.metadata[:full_description]) do
#      example.run
#    end
#  end
#end
