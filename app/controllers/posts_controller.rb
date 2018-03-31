class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC')
	end 

	# @post = Post.find(params[:id])
	# 	@user = User.find(params[:id])

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end


	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end 


	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end 

	def edit
		@post = Post.find(params[:id])
	end 

	private 

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end

end