Pod::Spec.new do |s|
  s.name         = 'ATZAlertController'
  s.version      = '0.1'
  s.platform	   = :ios, '8.0'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/shashankpali/ATZAlertController'
  s.authors      = { 'Shashank Pali' => 'shank.pali@gmail.com' }
  s.summary      = 'Show Alert without dependency on ViewController'
  s.source       = { :git => 'https://github.com/shashankpali/ATZAlertController.git', :tag => '0.1' }
  s.source_files = 'ATZAlertController/*.{h,m}'
  s.requires_arc = true
end