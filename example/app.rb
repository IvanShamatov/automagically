require 'bundler'
Bundler.require

Sequel.connect("sqlite3://development.sqlite3")
Sequel::Model.plugin :json_serializer

class Post < Sequel::Model
  plugin :json_serializer
end

module App
  class Blog < Automagically
    route :posts, Post.all
  end
end

run App::Blog.new