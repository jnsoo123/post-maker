class PostsController < ApplicationController
  def index
    render json: { posts: posts }
  end

  private

  def posts
    Post.all.collect do |post|
      {
        title: post.title,
        body: post.body
      }
    end
  end
end
