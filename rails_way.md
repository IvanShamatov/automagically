# OK. Rails way

So, how much effort do I need to create backend with rails?
```bash
mkdir spa 
cd spa
rvm use 2.2.2@rails5 --create
touch Gemfile
cat > Gemfile <<END_CONF
source "https://rubygems.org"
ruby '2.2.2'
gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'rack', :git => 'git://github.com/rack/rack.git'
gem 'arel', :git => 'git://github.com/rails/arel.git'
END_CONF
bundle
bundle exec rails new . --api --dev --force
bin/rails g model Post title:string content:text author:string
bin/rails db:migrate
bin/rails g controller Api::V1::Posts index show
```

Lets implement api 
```ruby
# app/controllers/api/v1/posts_controller.rb
module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = Post.all
        render json: @posts
      end

      def show
        @post = Post.find(params[:id])
        render json: @post
      end
    end
  end
end

# config/routes.rb
Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :posts, only: [:index, :show]
    end
  end
end
```

and now we can curl into it `curl http://localhost:3000/api/v1/posts` and get `[]` empty arry



http://stackoverflow.com/questions/913067/sqlite-as-a-production-database-for-a-low-traffic-site
http://www.sqlite.org/whentouse.html

Extra challenges
* form generation on fly

What makes me struggle and why I need some custom solution of a problem which I can solve in so many ways. Lines of code? Deployment? Server configuration.
Let's split it in parts. 
