# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ViewDeckExample'

  # Frameworks
  app.frameworks += [
    'QuartzCore'
  ]

  # Cocoapods
  app.pods do
    pod 'ViewDeck'
  end
end
