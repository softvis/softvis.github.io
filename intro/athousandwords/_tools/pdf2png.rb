#!/usr/bin/env ruby
Dir.foreach('.') do |iname|
	next unless iname =~ /^ali/
	oname = iname.gsub(/pdf$/, 'png')
	`sips '#{iname}' -s format png -Z 650 --out '#{oname}'`
end
