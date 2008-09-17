spec = Gem::Specification.new do |s| 
  s.name = "reddit"
  s.version = "0.3.0"
  s.author = "Brian Terlson"
  s.email = "btthalion@gmail.com"
  s.homepage = "http://github.com/bterlson/reddit/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Interface with the Reddit.com API."
  s.files = [
    "History.txt",
    "lib/reddit.rb",
    "lib/reddit/article.rb",
    "lib/reddit/comment.rb",
    "lib/reddit/comment_list.rb",
    "lib/reddit/reddit.rb",
    "lib/reddit/resource_list.rb",
    "lib/reddit/session.rb",
    "lib/reddit/user.rb",
    "lib/reddit/version.rb",
    "License.txt",
    "Manifest.txt",
    "Rakefile",
    "README.txt",
    "spec/article_spec.rb",
    "spec/comment_list_spec.rb",
    "spec/comment_spec.rb",
    "spec/reddit_spec.rb",
    "spec/resource_list_spec.rb",
    "spec/session_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "spec/user_spec.rb",
    "tasks/environment.rake",
    "tasks/rspec.rake"
  ]
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.txt"]
  s.add_dependency("json", ">= 1.1.2")
end
