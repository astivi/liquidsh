require 'liquid'
require 'json'

unless ARGV.length != 2 then
    filename = ARGV[0]
    @template = Liquid::Template.parse(File.read(filename))
    result = @template.render(JSON.parse(File.read(ARGV[1])))
    output = "#{filename}.html"
    f = File.new(output, 'w')
    puts "Writing result to #{output}"
    f.write(result)
    puts "Done!"
else
    puts "usage ruby liquid.rb {file.liquid} {file.json}"
end