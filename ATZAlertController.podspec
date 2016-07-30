Pod::Spec.new do |s|

  s.name              = 'ATZAlertController'
  s.version           = '1.2.1'
  s.platform          = :ios, '8.0'
  s.license           = { :type => 'MIT' }
  s.homepage          = 'https://github.com/shashankpali/ATZAlertController'
  s.authors           = { 'Shashank Pali' => 'shank.pali@gmail.com' }
  s.summary           = 'Show alert without dependency on ViewController'
  s.source            = { :git => 'https://github.com/shashankpali/ATZAlertController.git', :tag => s.version }
  s.requires_arc      = true
  s.source_files      = 'ATZAlertController/*.{swift}'

end