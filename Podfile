# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Gurunavi' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Gurunavi
    pod 'Alamofire'
    pod 'AlamofireImage'
    pod 'SwiftyJSON'    
  
  target 'GurunaviTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Alamofire'
    pod 'AlamofireImage'
    pod 'SwiftyJSON'    
  end

end

plugin 'cocoapods-keys', {
  :project => "Gurunavi",
  :keys => [
    "secretKeyID"
]}