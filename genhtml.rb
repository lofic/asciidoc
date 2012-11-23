#!/usr/bin/ruby
require 'fileutils'

# 
# Source : https://github.com/lofic/tips
#

theme = "black"

if not File.directory? './html'
  Dir.mkdir './html'
end

FileUtils.cp(Dir.glob('*.txt'),'html')

FileUtils.cd('html')
txtfilelist=Dir.glob('*.txt')

until txtfilelist.empty?
  Thread.new { %x[asciidoc  --theme=#{theme} #{txtfilelist.pop}] } unless Thread.list.length > 32
end

loop do
  if Thread.list.length < 2
    FileUtils.rm(Dir.glob('*.txt')) if Thread.list.length < 2
    break
  end
  sleep 0.1
end
