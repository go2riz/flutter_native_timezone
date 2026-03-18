Pod::Spec.new do |s|
  s.name             = 'flutter_native_timezone'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for getting the local timezone of the device.'
  s.description      = <<-DESC
Get the native timezone from iOS.
                       DESC
  s.homepage         = 'https://github.com/pinkfish/flutter_native_timezone'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'David Bennett' => 'pinkfishfrog@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.ios.deployment_target = '13.0'
end
