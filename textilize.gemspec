require File.expand_path('../lib/textilize/version', __FILE__)

Gem::Specification.new do |s|
  s.name    = 'textilize'
  s.version = Textilize::VERSION

  s.author = ['Mysen Huang', 'Adeh DeSandies']
  s.email  = 'mysen@kudelabs.com'

  s.homepage = 'http://github.com/kudelabs/textilize'
  s.summary  = 'Gem containing the textilize and textilize_without_paragraph methods removed from Rails without C Extensions.'

  s.files = Dir['lib/**/*', 'LICENSE', 'README.md']
  s.add_development_dependency 'rake'
end

