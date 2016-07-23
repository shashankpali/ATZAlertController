Pod::Spec.new do |s|

  s.name              = 'ATZAlertController'
  s.version           = '1.2'
  s.platform          = :ios, '8.0'
  s.license           = { :type => 'MIT' }
  s.homepage          = 'https://github.com/shashankpali/ATZAlertController'
  s.authors           = { 'Shashank Pali' => 'shank.pali@gmail.com' }
  s.summary           = 'Show Alert without dependency on ViewController'
  s.source            = { :git => 'https://github.com/shashankpali/ATZAlertController.git', :tag => s.version }
  s.requires_arc      = true
  s.default_subspecs  = 'Default'

  s.subspec 'Default' do |ss|
    ss.source_files   = 'ATZAlertController/*.{h,m}'
  end

  s.subspec 'Swift' do |ss|
    ss.source_files   = 'ATZAlertController->Swift/*.{swift}'
  end

end