class TagsController < ApplicationController
  def show
  	@post = Post.tagged_with(params[:id])
  end

  def index
  	@post = Post.tagged_with(params[:id])
  end
end
