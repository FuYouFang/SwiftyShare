#
# Be sure to run `pod lib lint SwiftyShare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyShare'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SwiftyShare.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/fuyoufang/SwiftyShare'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fuyoufang' => 'fuyoufang@163.com' }
  s.source           = { :git => 'https://github.com/fuyoufang/SwiftyShare.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.libraries = 'sqlite3'

#  s.default_subspecs = 'SwiftyShareCore'
#  s.static_framework = true

  s.source_files = "SwiftyShare/Classes/*.{h,m,swift}"
#  s.static_framework = true
#  s.vendored_frameworks = 'SwiftyShare/Support/ATAuthSDK.framework'
#  s.public_header_files = "SwiftyShare/Support/ATAuthSDK.framework/*.h"
#  s.vendored_frameworks = 'SwiftyShare/Support/TencentOpenAPI.framework'
#  s.public_header_files = "SwiftyShare/Support/TencentOpenAPI.framework/*.h"
#  s.resources = 'SwiftyShare/Support/ATAuthSDK.framework/ATAuthSDK.bundle'

# s.frameworks =  "Foundation","UIKit"
##  s.public_header_files = "SwiftyShare/Classes/TencentOpenAPI.framework/*.h"
#
#  s.libraries = 'sqlite3','c++','iconv', 'stdc++', 'z'
##  s.dependency 'SwiftyShare/SwiftyShareCore'
##  s.dependency 'SwiftyShare/PlatformConnector/QQ'
#  s.frameworks = "Foundation", 'Security', 'CoreGraphics', 'WebKit', 'SystemConfiguration', 'CoreTelephony'


#  s.xcconfig  =  {'OTHER_LDFLAGS' => '-ObjC' }

  
  # 核心模块
  s.subspec 'SwiftyShareCore' do |sp|
      #      sp.vendored_frameworks = 'SwiftyShare/SwiftyShare.framework','SwiftyShare/Support/Required/SwiftyShareConnector.framework'
      sp.source_files = "SwiftyShare/Classes/*.{h,m,swift}"
  end
  
  # Extension 模块
  s.subspec 'Extension' do |sp|
      #      sp.vendored_frameworks = 'SwiftyShare/SwiftyShare.framework','SwiftyShare/Support/Required/SwiftyShareConnector.framework'
      sp.dependency 'SwiftyShare/SwiftyShareCore'
      sp.source_files = "SwiftyShare/Extension/*.swift"
  end

  s.subspec 'PlatformConnector' do |sp|
    # WeChat
    sp.subspec 'Wechat' do |ssp|
        ssp.source_files = "SwiftyShare/Support/PlatformConnector/Wechat/*.{h,m,swift}"
    end
    
    sp.subspec 'QQ' do |ssp|
        ssp.source_files = "SwiftyShare/Support/PlatformConnector/QQ/*.{h,m,swift}"
#        ssp.vendored_frameworks = 'SwiftyShare/Support/PlatformSDK/QQ/TencentOpenAPI.framework'
    end
    
  end
  
  s.subspec 'Platforms' do |sp|
      # WeChat
      sp.subspec 'WeChat' do |ssp|
          ssp.vendored_libraries = "SwiftyShare/Support/PlatformSDK/WeChat/*.a"
          ssp.source_files = "SwiftyShare/Support/PlatformSDK/WeChat/*.{h,m}"
          ssp.public_header_files = "SwiftyShare/Support/PlatformSDK/WeChat/*.h"
          ssp.libraries = 'sqlite3'
          ssp.libraries = 'c++'
          ssp.dependency 'SwiftyShare/SwiftyShareCore'
          ssp.dependency 'SwiftyShare/PlatformConnector/Wechat'
          ssp.frameworks = 'Security', 'CoreGraphics', 'WebKit'
      end
      
      # WeChat_NoPay
      #      sp.subspec 'WeChat_NoPay' do |ssp|
      #          ssp.vendored_libraries = "SwiftyShare/Support/PlatformSDK/WeChat_NoPay/*.a"
      #          ssp.source_files = "SwiftyShare/Support/PlatformSDK/WeChat_NoPay/*.{h,m}"
      ##          ssp.vendored_frameworks = 'SwiftyShare/Support/PlatformConnector/WechatConnector.framework'
      #          ssp.public_header_files = "SwiftyShare/Support/PlatformSDK/WeChat_NoPay/*.h"
      #          ssp.libraries = 'sqlite3'
      ##          ssp.dependency 'SwiftyShare'
      #          ssp.resource_bundles = {
      #              'SwiftyShare_JS_WeChat' => ['SwiftyShare/Support/Required/SwiftyShare.bundle/ScriptCore/platforms/WeChat.js']
      #          }
      #      end
      
      sp.subspec 'QQ' do |ssp|
          ssp.vendored_frameworks = 'SwiftyShare/Support/PlatformSDK/QQ/TencentOpenAPI.framework'
#          ssp.source_files = "SwiftyShare/Support/PlatformSDK/QQ/TencentOpenAPI.framework/Headers/*.{h,m}"
#          ssp.public_header_files = "SwiftyShare/Support/PlatformSDK/QQ/TencentOpenAPI.framework/Headers/*.h"
          ssp.libraries = 'sqlite3','c++','iconv', 'stdc++', 'z'
          ssp.dependency 'SwiftyShare/SwiftyShareCore'
          ssp.dependency 'SwiftyShare/PlatformConnector/QQ'
          ssp.frameworks = 'Security', 'CoreGraphics', 'WebKit', 'SystemConfiguration', 'CoreTelephony'

      end
      
      
      
  end


  # s.resource_bundles = {
  #   'SwiftyShare' => ['SwiftyShare/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'WechatOpenSDK'
end
