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

  s.subspec 'CAtomic' do |ss|
    ss.source_files = 'Sources/CAtomic/**/*.swift'
  end

  s.subspec 'cmark-gfm' do |ss|
    ss.source_files = 'Vendor/swift-cmark/src/**/*.{c,h}'
    ss.public_header_files = 'Vendor/swift-cmark/src/**/*.h'
    ss.header_mappings_dir = 'Vendor/swift-cmark/src'
  end

  s.subspec 'cmark-gfm-extensions' do |ss|
    ss.source_files = 'Vendor/swift-cmark/extensions/**/*.{c,h}'
    ss.public_header_files = 'Vendor/swift-cmark/extensions/**/*.h'
    ss.header_mappings_dir = 'Vendor/swift-cmark/extensions'
    ss.dependency 'SwiftMarkdown/cmark-gfm'
  end

  s.subspec 'Markdown' do |ss|
    ss.source_files = 'Sources/Markdown/**/*.swift'
    ss.dependency 'SwiftMarkdown/CAtomic'
    ss.dependency 'SwiftMarkdown/cmark-gfm'
    ss.dependency 'SwiftMarkdown/cmark-gfm-extensions'
  end

  # default
  s.default_subspecs = 'Markdown'
end