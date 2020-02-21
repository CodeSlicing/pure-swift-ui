Pod::Spec.new do |spec|
  spec.name         = "PureSwiftUI"
  spec.version      = "1.14.1"
  spec.summary      = "PureSwiftUI is a Swift package designed to enhance the experience of writing SwiftUI code."
  spec.description  = <<-DESC
We all love SwiftUI, and what the engineers at Apple have achieved is nothing short of ground-breaking. Often, however, a View can become cluttered with argument labels, type coercion, and various other aspects of day-to-day View creation that tend to get in the way of the design. With SwiftUI being a design language as much as anything else, PureSwiftUI was created to remove as much code external to intent as possible while retaining the expressiveness of the base API. As someone who exclusively writes views in code, a secondary consideration was to reduce the amount of typing as much as possible.
                   DESC
  spec.homepage     = "https://github.com/CodeSlicing/pure-swift-ui"
  spec.license      = { :type => "MIT", :file => "Assets/Docs/LICENCE.md" }
  spec.author             = "Adam Fordyce"
  spec.social_media_url   = "https://twitter.com/CodeSlice"
  
  spec.ios.deployment_target = "13.0"
  
  spec.source = { :git => "https://github.com/CodeSlicing/pure-swift-ui.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/**/*.{swift}"
  spec.swift_version = "5.1"
  spec.framework  = "SwiftUI"
end
