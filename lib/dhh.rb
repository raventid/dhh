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
                ['Have you been looking for favicon, it does not exist.'],
        ]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
      rescue
        return [500,
                {'Content-Type' => 'text/html'},
                ["Something went wrong!"]
        ]
      end

			[200,
       {'Content-Type' => 'text/html'},
			 [text]
			]
		end
	end
end
