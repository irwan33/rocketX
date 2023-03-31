# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RocketX' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RocketX
  pod 'Kingfisher', '~> 5.14.0'
  pod 'SnapKit'
  pod 'RxSwift', '6.0.0'
  pod 'RxCocoa', '6.0.0'
  pod 'Alamofire', '~> 5.2'
  pod 'SwiftMessages'

  target 'RocketXTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RocketXUITests' do
    # Pods for testing
  end

end

post_install do |installer|
     installer.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
            end
         end
     end
  end
