= reddit

* http://github.com/bterlson/reddit/

== DESCRIPTION:

An interface to the reddit API.

== FEATURES/PROBLEMS:

* Retreive articles and their comments
* Retreive user pages

== SYNOPSIS:

require 'rubygems'
require 'reddit'

reddit = Reddit::Session.new

reddit.main.articles.each do |article|
  p article.url
  
  article.comments.each do |comment|
    p comment.body
  end
end

p reddit.subreddit("programming").articles[1].author

reddit.user("radhruin").comments.each do |comment|
  p comment.body
end

== REQUIREMENTS:

* JSON >= 1.1.2 

== INSTALL:

* sudo gem install bterlson-reddit --source=http://gems.github.com

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.