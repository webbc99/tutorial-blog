class Apis::Posts::V1::PostsController < ApplicationController
  # def index
  #   @posts = []
  #   Post.all.each do |post|
  #     p = {
  #       title: post.title,
  #       content: post.content,
  #       user: User.find(post.user_id).name,
  #       topic: Topic.find(post.topic_id).name
  #     }
  #     @posts << p
  #   end
  #   render json: @posts 
  # end

  # def latest_post
  #   @post = Post.last
  #   post = {
  #     title: @post.title,
  #     content: @post.content,
  #     user: User.find(@post.user_id).name,
  #     topic: Topic.find(@post.topic_id).name
  #   }
  #   render json: post
  # end

  def latest_post
    render json: formatted_post(Post.last)
  end

  def index
    @posts = []
    Post.all.each do |post|
      @posts << formatted_post(post)
    end
    render json: @posts
  end

  private

  def formatted_post(post)
    formatted_post_data = {
      title: post.title,
      content: post.content,
      user: User.find(post.user_id).name,
      topic: Topic.find(post.topic_id).name
    }
    formatted_post_data
  end
end