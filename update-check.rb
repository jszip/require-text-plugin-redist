#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'json'
require 'open-uri'

current = Gem::Version.new(JSON.parse(open('https://github.com/requirejs/text/raw/master/package.json').read)["version"])

maven = Gem::Version.new(Nokogiri::XML(File.open("pom.xml")).remove_namespaces!.xpath("/project/version").first.content().sub /-SNAPSHOT/,"")

if current >= maven
	puts "A release can be made"
	exit 1 
end
puts "Everything up to date"