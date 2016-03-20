require "erubis"
require "dhh/file_model"

module Dhh
  class Controller
    include Dhh::Model

    def initialize(env)
      @env = env
    end
  
    def env
      @env
    end
 
    # Local variables is a hash of key: :value
    def render(view_name, locals = {})
      filename = File.join "app", "views", 
        controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env)
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Dhh.to_underscore klass
    end
  end
end
