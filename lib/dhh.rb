require "dhh/version"

module Dhh
	class Application
		def call(env)
			[200,
       {'Content-Type' => 'text/html'},
			 ["Hello from Ruby on DHH :p"]
			]
		end
	end
end
