spec = Gem::Specification.new do |s| 
  s.name = "reddit"
  s.version = "0.3.0"
  s.author = "Brian Terlson"
  s.email = "btthalion@gmail.com"
  s.homepage = "http://github.com/bterlson/reddit/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Interface with the Reddit.com API."
  s.files = `git ls-files`.split("\n")
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = Dir["README.txt"]
  s.add_dependency("json", ">= 1.1.2")
end
