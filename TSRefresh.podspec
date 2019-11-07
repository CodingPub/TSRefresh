#
#  Be sure to run `pod spec lint JBRefresh.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "TSRefresh"
  s.version      = "1.0"
  s.summary      = "TSRefresh is MTSRefresh-swift"

  s.description  = <<-DESC
  TSRefresh is MTSRefresh-swift,hehe~
                   DESC

  s.homepage     = "https://github.com/Tovema-Swift/TSRefresh"
  s.license      = "MIT"
  s.author       = { 'lxb_0605@qq.com' => 'lxb_0605@qq.com' }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Tovema-Swift/TSRefresh.git", :tag => "#{s.version}" }

  s.source_files  = "TSRefresh/**/*.{h,swift}"
  s.resources = "TSRefresh/*.{bundle, png}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
