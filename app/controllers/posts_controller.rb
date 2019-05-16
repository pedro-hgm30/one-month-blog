class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy] 
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.author_id = current_author.id 
    if @post.save
      redirect_to '/'
    else 
      redirect_to '/posts/new'
    end
  end

  def show
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :author_id)
    end


end
