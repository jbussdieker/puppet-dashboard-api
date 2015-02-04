module PuppetDashboard
  class Base < ActiveResource::Base
    self.site = "http://localhost:3000"
    #self.logger = Logger.new(STDERR)
    self.include_format_in_path = false
    self.include_root_in_json = true

    def [](key)
      parameters.attributes[key]
    end
  end
end
