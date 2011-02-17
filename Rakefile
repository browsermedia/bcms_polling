# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "bcms_polling"
    gemspec.rubyforge_project = "browsercms"
    gemspec.summary = "A Polling Module for BrowserCMS"
    gemspec.email = "github@browsermedia.com"
    gemspec.homepage = "http://browsercms.org"
    gemspec.description = "Allows for user feedback via short polling questions."
    gemspec.authors = ["BrowserMedia"]
    gemspec.files = []
    gemspec.files += Dir["app/**/*"]
    gemspec.files -= Dir["app/views/layouts/templates/*"]
    gemspec.files -= Dir["app/controllers/application_controller.rb"]
    gemspec.files -= Dir["app/helpers/application_helper.rb"]
    gemspec.files += Dir["doc/**/*"]
    gemspec.files += Dir["db/migrate/[0-9]*.rb"].reject {|f| f =~ /_browsercms|_load_seed/ }
    gemspec.files += Dir["lib/**/*"]
    gemspec.files += Dir["rails/init.rb"]
    gemspec.files += Dir["public/bcms/polling/**/*"]
    gemspec.files += Dir["README.markdown"]
    gemspec.files += Dir["Rakefile"]
    gemspec.files += Dir["LICENSE.txt"]
    gemspec.files += Dir["COPYRIGHT.txt"]
    gemspec.files += Dir["VERSION"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

Jeweler::GemcutterTasks.new