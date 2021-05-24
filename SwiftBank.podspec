#
# Be sure to run `pod lib lint SwiftBank.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftBank'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SwiftBank.'
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/matomairo@gmail.com/SwiftBank'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'matomairo@gmail.com' => 'migueltomairo@bcp.com.pe' }
  s.source           = { :git => 'https://github.com/matomairo@gmail.com/SwiftBank.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.vendored_frameworks = "SwiftBank/TPCSDK/TPCSDKSwift.xcframework"

  s.ios.deployment_target = '11.0'

  s.source_files = 'SwiftBank/Classes/**/*'
  
#  s.user_target_xcconfig = {
#        'SWIFT_INCLUDE_PATHS' => '"\$(PODS_ROOT)/SwiftBank/TPCSDK/TPCSDKSwift.xcframework"'
#      }
  
  # s.resource_bundles = {
  #   'SwiftBank' => ['SwiftBank/Assets/*.png']
  # }

#  s.xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
#  s.static_framework = true
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'BCPCoreNetwork'
  # s.dependency 'BCPCoreResources'
end
