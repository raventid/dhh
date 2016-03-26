require "dhh/version"
require "dhh/array"
require "dhh/routing"
require "dhh/util"
require "dhh/dependencies"
require "dhh/controller"

module Dhh
	class Application
		def call(env)
      
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
                {'Content-Type' => 'text/html'},
                [],
        ]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
        rack_response = controller.get_response
        if rack_response
          [rack_response.status, rack_response.headers, [rack_response.body].flatten]
        else
          [200,
           {'Content-Type' => 'text/html'}, 
           [text]
          ]
        end
      rescue
        return [500,
                {'Content-Type' => 'text/html'},
                ["Something went wrong!"]
        ]
      end
		end
	end
end
