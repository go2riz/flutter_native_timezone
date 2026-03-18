Pod::Spec.new do |s|
  s.name             = 'flutter_native_timezone'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for getting the local timezone of the device.'
  s.description      = <<-DESC
A Flutter plugin for getting the local timezone of the device.
                       DESC
  s.homepage         = 'https://github.com/pinkfish/flutter_native_timezone'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'David Bennett' => 'pinkfishfrog@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.platform         = :osx, '10.15'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version    = '5.0'
end
