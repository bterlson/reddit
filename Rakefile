require 'rake/gempackagetask'

spec = Gem::Specification.new do |s| 
  s.name = "Reddit"
  s.version = "0.1.0"
  s.author = "Brian Terlson"
  s.email = "btthalion@gmail.com"
  s.homepage = "http://github.com/bterlson/reddit/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Interface with the Reddit.com API."
  s.files = FileList["{bin,lib}/**/*"].to_a
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.txt"]
  s.add_dependency("json", ">= 1.1.2")
end
 
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

Dir['tasks/**/*.rake'].each { |rake| load rake }