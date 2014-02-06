Pod::Spec.new do |podspec|
  podspec.name = 'BloodMagic'
  podspec.version = '0.6.0'
  podspec.ios.deployment_target = '5.0'
  podspec.osx.deployment_target = '10.7'
  podspec.license = { :type => 'MIT' }
  podspec.summary = 'BloodMagic provides kind of custom property attributes'
  podspec.homepage = 'https://github.com/railsware/BloodMagic'
  podspec.author   = { 'Alex Denisov' => '1101.debian@gmail.com' }
  podspec.source = { :git => 'https://github.com/railsware/BloodMagic.git', :tag => "#{podspec.version}" }
  podspec.requires_arc = true


  podspec.subspec 'Core' do |core|
    core.source_files = 'BloodMagic/Sources/Modules/Core/**/*.{h,m,mm}'
    core.public_header_files = 'BloodMagic/Sources/Modules/Core/Public/**/*.h', 'BloodMagic/Sources/Modules/Core/Core.h'
    core.libraries = 'c++'
  end

  podspec.subspec 'Initializers' do |initializers|
    initializers.source_files = 'BloodMagic/Sources/Modules/Initializers/**/*.{h,m,mm}'
    initializers.public_header_files = 'BloodMagic/Sources/Modules/Initializers/Public/**/*.h', 'BloodMagic/Sources/Modules/Initializers/Initializers.h'
    initializers.dependency 'BloodMagic/Core'
  end

  podspec.subspec 'Lazy' do |lazy|
    lazy.source_files = 'BloodMagic/Sources/Modules/Lazy/**/*.{h,m,mm}'
    lazy.public_header_files = 'BloodMagic/Sources/Modules/Lazy/Public/**/*.h', 'BloodMagic/Sources/Modules/Lazy/Lazy*.h'
    lazy.dependency 'BloodMagic/Initializers'
  end

  podspec.subspec 'Partial' do |partial|
    partial.source_files = 'BloodMagic/Sources/Modules/Partial/**/*.{h,m,mm}'
    partial.public_header_files = 'BloodMagic/Sources/Modules/Partial/Public/**/*.h', 'BloodMagic/Sources/Modules/Partial/Partial.h'
    partial.dependency 'BloodMagic/Core'
    partial.platform = :ios
  end

  podspec.subspec 'Final' do |partial|
    partial.source_files = 'BloodMagic/Sources/Modules/Final/**/*.{h,m,mm}'
    partial.public_header_files = 'BloodMagic/Sources/Modules/Final/Public/**/*.h', 'BloodMagic/Sources/Modules/Final/Final.h'
    partial.dependency 'BloodMagic/Core'
  end

  podspec.xcconfig = {
    'OTHER_LDFLAGS' => '-lc++ -ObjC',
    'CLANG_CXX_LIBRARY' => 'libc++'
  }

end

