Pod::Spec.new do |s|

  s.name         = "SYPageControl"
  s.version      = "1.1.1"
  s.summary      = "SYPageControl can be use with several styles for developer."
  s.homepage     = "https://github.com/potato512/SYPageControl"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "devZhang" => "zhangsy757@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/potato512/SYPageControl.git", :tag => s.version.to_s }

  s.source_files  = "SYPageControl/*.{h,m}"
  s.public_header_files = "SYPageControl/*.h"

  s.requires_arc = true

end
