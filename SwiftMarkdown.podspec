Pod::Spec.new do |s|
  s.name         = 'SwiftMarkdown'
  s.version      = '0.1.0'
  s.summary      = 'Swift implementation of a CommonMark-compliant Markdown parser.'
  s.homepage     = 'https://github.com/jorjyb0i/swift-markdown'
  s.license      = { :type => 'Apache License 2.0', :file => 'LICENSE.txt' }
  s.author       = { 'Apple & contributors' => 'support@example.com' }

  s.source       = { :git => 'https://github.com/jorjyb0i/swift-markdown.git',
                     :tag => s.version.to_s }

  s.platform     = :ios, '13.0'
  s.swift_version = '5.9'
  s.requires_arc = true

  s.source_files = [
    'Sources/Markdown/**/*.swift',
    'Sources/CAtomic/**/*.swift',
    'Vendor/swift-cmark/Sources/cmark-gfm/src/**/*.{c,h}',
    'Vendor/swift-cmark/Sources/cmark-gfm-extensions/src/**/*.{c,h}'
  ]

  s.public_header_files = [
    'Vendor/swift-cmark/src/**/*.h',
    'Vendor/swift-cmark/extensions/**/*.h'
  ]

  s.header_mappings_dir = 'Vendor/swift-cmark'

  s.pod_target_xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'DEFINES_MODULE' => 'YES'
  }
end