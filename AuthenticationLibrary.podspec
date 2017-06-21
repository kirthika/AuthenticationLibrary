Pod::Spec.new do |spec|
  spec.name = "AuthenticationLibrary"
  spec.version = "1.0.0"
  spec.summary = "Sample framework from blog post, not for real world use."
  spec.homepage = "https://github.com/kirthika/AuthenticationLibrary"
  spec.license = 'MIT'
  spec.author = { "Kirthika" => 'kirthika.vijayakumar@yahoo.com' }
  spec.platform = :ios, "10.3"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/kirthika/AuthenticationLibrary.git" }
  spec.source_files  = 'AuthenticationLibrary', 'AuthenticationLibrary/**/*.{h,m,swift}'
  spec.resource_bundles = {
  'authLibraryResources' => ['AuthenticationLibrary/**/*.{storyboard,xib,plist}']
}
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.1' }
  spec.dependency 'KeychainAccess'
  spec.dependency 'JWT'
  spec.dependency 'Alamofire'
  
end
