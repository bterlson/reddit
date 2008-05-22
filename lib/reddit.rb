$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'json'
require 'net/http'
require 'reddit/resource_list'
require 'reddit/comment_list'
require 'reddit/comment'
require 'reddit/session'
require 'reddit/version'
require 'reddit/reddit'
require 'reddit/article'
require 'reddit/user'