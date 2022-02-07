class Apis::Posts::V2::PostsController < ApplicationController
  def index
    @posts = []
    Post.all.each do |post|
      p = {
        title: post.title,
        content: post.content,
        user: User.find(post.user_id).name,
        topic: Topic.find(post.topic_id).name
      }
      @posts << p
    end
    render json: @posts 
  end
end