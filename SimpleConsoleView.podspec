#
# Be sure to run `pod lib lint SimpleConsoleView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleConsoleView'
  s.version          = '1.0.0'
  s.summary          = 'You can display a simple console on ViewController.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'By typing SCprint on ViewController you can display it as a simple console on that ViewController.'

  s.homepage         = 'https://github.com/KikurageChan/SimpleConsoleView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KikurageChan' => 'auricularia0817@gmail.com' }
  s.source           = { :git => 'https://github.com/KikurageChan/SimpleConsoleView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Classes/**/*.swift'
  
  s.resource_bundles = {
    'SimpleConsoleView' => ['Assets/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
