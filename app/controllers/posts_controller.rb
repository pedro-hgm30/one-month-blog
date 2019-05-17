class PostsController < ApplicationController
  before_action :authenticate_author!, only: [:new, :edit, :update, :destroy, :create] 

  before_action :set_post, only: [:show, :edit, :update, :destroy] 
  
  def index
    if params[:search]
			@posts = Post.search(params[:search]).all.order('created_at desc').paginate(page: params[:page], per_page: 7)
		else
			@posts = Post.all.order('created_at desc').paginate(page: params[:page], per_page: 7)
		end
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.author_id = current_author.id 
    if @post.save
      flash[:notice] = "#{@post.title} successfully posted!"
      redirect_to '/'
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "#{@post.title} successfully updated!"
      redirect_to '/'
    else 
      redirect_to @post
    end
  end

  def destroy
    @post.destroy
    redirect_to '/'
  end

  def author
    posts = Post.all
    
    @author = params[:author]
    
    #@author_search = Author.where(["author_name = '%s'", @author])
    @posts_by_author = []
    posts.each do |post|
      if post.author != nil
        if post.author.name == @author
          @posts_by_author << post
        end
      end
    end
    @paginated_authors = @posts_by_author.paginate(page: params[:page], per_page: 5)
    #.paginate(:page => params[:page], :per_page => 5)
    #@author_id = Author.where(["author_id = '%s'", @author_search.id])
    
    #@posts_by_author = Post.where(["author_id = '%s'", @author_id]).paginate(page: params[:page], per_page: 5)
  
    @authorvalid = []
    posts.each do |post|
      if post.author != nil
       @authorvalid << post.author.name
      end
		end
		if (@authorvalid).include?(@author)
			render :author
		else
			render file: "#{Rails.root}/public/404.html" , status: 404
		end
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
