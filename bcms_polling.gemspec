# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bcms_polling/version"

Gem::Specification.new do |s|
  s.name = %q{bcms_polling}
  s.version = BcmsPolling::VERSION

  s.authors = ["BrowserMedia"]
  s.description = %q{Allows for user feedback via short polling questions.}
  s.email = %q{github@browsermedia.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  
  s.files = Dir["{app,config,db,lib}/**/*"]
  s.files += Dir["Gemfile", "LICENSE.txt", "COPYRIGHT.txt", "GPL.txt" ]
  s.test_files += Dir["test/**/*"]
  s.test_files -= Dir['test/dummy/**/*']
  s.add_dependency("browsercms", "< 3.6.0", ">= 3.5.0")
  
  s.homepage = %q{http://browsercms.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = s.name
  s.summary = %q{A Polling Module for BrowserCMS}
 
end

