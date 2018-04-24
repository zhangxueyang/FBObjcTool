
Pod::Spec.new do |s|

    s.name         = "FBObjcTool"
    s.version      = "0.1.0"
    s.summary      = "Helper methods"
    s.description  = "Helper methods difficult"

    s.homepage     = "https://github.com/zhangxueyang/FBObjcTool"
    s.license      = "MIT"

    s.author             = { "cocoazxy" => "cocoazxy@gmail.com" }
    s.source       = { :git => "https://github.com/zhangxueyang/FBObjcTool.git", :tag => "#{s.version}" }

    s.source_files  = "Classes", "FBObjcTool/Classes/**/*.{h,m}"

    s.platform     = :ios, '7.0'
    s.requires_arc = true

end
