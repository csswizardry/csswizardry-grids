#!/usr/bin/env ruby

result = `sass csswizardry-grids.scss build.css`
raise result unless $?.to_i == 0
puts "Regular sass compiled successfully"

result = `sass test/silent.scss build.silent.css --style compressed`
raise result unless $?.to_i == 0
raise "When $use-silent-classes is set to true the module should not output any CSS" unless File.size('build.silent.css') == 0
puts "Silent sass compiled successfully"
