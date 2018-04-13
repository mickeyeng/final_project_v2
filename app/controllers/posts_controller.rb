class PostsController < ApplicationController
	before_action :set_post, only: [:show, :vote]
	respond_to :js, :json, :html

	def index
		if params[:tag]
			@posts = Post.all.tagged_with(params[:tag]).order("created_at DESC")
		else 
			@posts =  Post.all.order("created_at DESC")
		end
		@countTags = Post.all.tag_counts_on(:tags).size
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

	def vote

    	if !current_user.liked? @post
     		@post.liked_by current_user
    	elsif current_user.liked? @post 
      		@post.unliked_by current_user
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

	def tag_list
  		self.tags.map(&:name).join(', ')
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
		params.require(:post).permit(:user_id, :title, :content, :image, :tag_list)
	end

	def set_post 
		@post = Post.find(params[:id])
	end 

end