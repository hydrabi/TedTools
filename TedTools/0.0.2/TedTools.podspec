#
# Be sure to run `pod lib lint TedTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TedTools'
  s.version          = '0.0.2'
  s.summary          = 'Tools'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/hydrabi/TedTools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1016590797@qq.com' => 'bizhifengted@gmail.com' }
  s.source           = { :git => 'https://github.com/hydrabi/TedTools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'TedTools/Classes/Tools.h'
  
  #-----Subspec -------#
  
  s.subspec 'Base' do |ss|
    ss.source_files = 'TedTools/Classes/Base/**/*'
    ss.dependency 'AFNetworking'
    ss.dependency 'Masonry'
    ss.dependency 'TedTools/Category'
    ss.dependency 'ReactiveCocoa', '~> 2.5'
    end
  s.subspec 'CustomView' do |ss|
  ss.source_files = 'TedTools/Classes/CustomView/**/*'
  ss.dependency 'TedTools/Category'
  end
  
  s.subspec 'Category' do |ss|
    ss.source_files = 'TedTools/Classes/Category/**/*'
    ss.subspec 'UserDefault' do |sss|
        sss.source_files = 'TedTools/Classes/Category/UserDefault/**/*'
        end
  end
  s.subspec 'Utils' do |ss|
    ss.source_files = 'TedTools/Classes/Utils/**/*'
    ss.dependency 'TedTools/Category'
  end
  
  # s.resource_bundles = {
  #   'TedTools' => ['TedTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
