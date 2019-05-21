class CommentsController < ApplicationController
  

  
  def create
    
    @post = Post.friendly.find(params[:post_id])
    
    @comment = @post.comments.new(params[:comment].permit(:body))
    
   # if author_signed_in?
     # @comment.author_id = current_author.id 
    if user_signed_in?
    @comment.user_id = current_user.id 
    else 
      flash[:alert] = "You must be signed in to comment!"
      redirect_to post_path(@post) and return
    end
    
    if @comment.save
      flash[:notice] = "Comment successfuly posted"
      redirect_to post_path(@post) and return
    else
     flash[:alert] = "Couldn't save your comment!"
     redirect_to post_path(@post) and return
    end  	
  end
  
	def destroy
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
  
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end

end
