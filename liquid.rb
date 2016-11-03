require 'liquid'
require 'json'

unless ARGV.length != 2 then
    filename = ARGV[0]
    @template = Liquid::Template.parse(File.read(filename))
    result = @template.render(JSON.parse(File.read(ARGV[1])))
    dir = "#{File.dirname(File.absolute_path(filename))}/output"
    Dir.mkdir(dir) unless Dir.exist?(dir)
    output = "#{dir}/#{File.basename(filename, '.*')}.html"
    f = File.new(output, 'w')
    puts "Writing result to #{output}"
    f.write(result)
    puts "Done!"
else
    puts "usage ruby liquid.rb {file.liquid} {file.json}"
end
