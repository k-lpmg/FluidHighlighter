Pod::Spec.new do |s|
  s.name         = "FluidHighlighter"
  s.version      = "2.0.0"
  s.summary      = "FluidHighlighter easily implements the Fluid Interface based highlighting effect on UIView and UIControl."
  s.homepage     = "https://github.com/k-lpmg/FluidHighlighter"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "DongHee Kang" => "kanglpmg@gmail.com" }
  s.source       = { :git => "https://github.com/k-lpmg/FluidHighlighter.git", :tag => s.version.to_s }
  s.documentation_url = "https://github.com/k-lpmg/FluidHighlighter/blob/master/README.md"

  s.ios.source_files  = "Sources/**/*.swift"
  s.ios.deployment_target = "8.0"
end
