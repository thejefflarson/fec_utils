require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "fec_utils"
    gem.summary = %Q{fec utilities}
    gem.description = %Q{take a look at your govt}
    gem.email = "thejefflarson@gmail.com"
    gem.homepage = "http://github.com/thejefflarson/fec_utils"
    gem.authors = ["Jeff Larson"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "fec_utils #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


require 'lib/fec_utils'

desc "parse pas"
task :pas do
  rows = File.open(File.join(File.dirname(__FILE__), "assets", "itpas2.dta")).read.split("\n")
  parsed_rows = FecUtils::ItemizedParsers::PasParse.rows_by_transaction_type(rows, ["24F"])
  parsed_rows.each do |row|
    str = ""
    FecUtils::ItemizedParsers::PasParse.columns.each do |column|
     str << row.send(column).to_s + "\t"
    end
    puts str
  end
end

task :pas_breakdown do
  rows = File.open(File.join(File.dirname(__FILE__), "assets", "itpas2.dta")).read.split("\n")
  FecUtils::ItemizedParsers::PasParse.count_by_transaction_type(rows).each do |key, value|
    puts "#{key}\t#{value}"
  end
end




