class CommentsController < ApplicationController
  
  before_action :set_post
  
  before_action :set_comment, :comment_permitted?, only: [:create]

  def create
    if @comment.save
      flash[:notice] = "Comment successfuly posted"
      redirect_to post_path(@post) and return
    else
     flash[:alert] = "Couldn't save your comment!"
     redirect_to post_path(@post) and return
    end  	
  end
  
	def destroy
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
  
  private
  
  def set_post
    @post = Post.friendly.find(params[:post_id])
  end
  
  def set_comment
    @comment = @post.comments.new(params[:comment].permit(:body))
  end


  def comment_permitted?
    if author_signed_in?
      @comment.author_id = current_author.id 
    elsif user_signed_in?
      @comment.user_id = current_user.id 
    else 
      flash[:alert] = "You must be signed in to comment!"
      redirect_to post_path(@post) and return
    end
  end

end
