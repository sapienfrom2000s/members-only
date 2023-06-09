require 'pry-byebug'

class PostsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.build(allow_params)
		if @post.save
        	flash[:success] = "You successfully created the post"
        	redirect_to post_path(@post) # go to show page for @post
      	else
        	flash.now[:error] = "Unable to create post"
        	render :new, status: :unprocessable_entity
      	end
	end

	private

	def allow_params
		params.require(:post).permit(:title, :body)
	end
end
