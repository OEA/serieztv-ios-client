# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target ‘serieztv’ do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'SnapKit', '~> 3.0.2'
  pod 'Alamofire', '~> 4.0'
  pod 'SDWebImage', '~>3.7'
  pod 'SwiftyJSON'
  pod 'JTAppleCalendar', '~> 7.0'
  # Pods for hesapkitap
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0' # or '3.0'
          end
      end
  end
end
