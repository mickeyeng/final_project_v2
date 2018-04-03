class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC')
		@comments = Comment.all
		@users = User.all
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
		# @post = current_user.posts.build(post_params)

		# if @post.save
		# 	redirect_to @post
		# else
		# 	render 'new'
		# end


		@post = Post.new(post_params)
		@post.user_id = current_user.id # assign the post to the user who craeted it
		
			if (@post.save)
				redirect_to @post
				flash[:notice] = "Post was successfuly created"
			else
			 	render 'new' 
			 	flash[:alert] = "Post was unsuccessfull, please try again."
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
		params.require(:post).permit(:user_id, :title, :content, :image)
	end

end