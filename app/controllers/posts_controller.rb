class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		@post = Post.new(allow_params)
		if @post.save
        	flash[:success] = "You successfully created the post"
        	redirect_to post_path(@post.id) # go to show page for @post
      	else
        # code to set up error message
        	render :new, status: :unprocessable_entity
      	end
	end

	private

	def allow_params
		params.require(:post).permit(:title, :body)
	end
end
