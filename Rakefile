# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

require 'rubygems'
require 'motion-cocoapods'

require 'bubble-wrap'
require 'bubble-wrap/location'
require 'motion_model'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'Chief'

  app.identifier = 'com.chief'

  app.pods do
    pod 'SDWebImage'
  end
end
