require "erubis"

template = <<TEMPLATE
Hello! This is default template.
This template has <%= whatever  %>.
TEMPLATE

eruby = Erubis::Eruby.new(template)
puts eruby.src
puts "========"
puts eruby.result(:whatever => "unicorns!")
