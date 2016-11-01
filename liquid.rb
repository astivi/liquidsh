require 'liquid'
require 'json'

unless ARGV.length != 2 then
    filename = ARGV[0]
    @template = Liquid::Template.parse(File.read(filename))
    result = @template.render(JSON.parse(File.read(ARGV[1])))
    f = File.new(filename.gsub("\.liquid", ".html"), 'w')
    f.write(result)
else
    puts "usage ruby liquid.rb {liquidFile} {jsonFile}"
end