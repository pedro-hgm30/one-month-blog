class PostsController < ApplicationController
  before_action :authenticate_author!, only: [:new, :edit, :update, :destroy, :create] 

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  before_action :set_search, only: [:show, :edit, :update, :destroy, :author, :new, :create, :about, :contact] 

  # before_action :find_posts_by_author, :validates_author, only: [:author]
  
  def index
    if params[:search]
			@posts = Post.search(params[:search]).all.order('created_at desc').paginate(page: params[:page], per_page: 5)
		else
			@posts = Post.all.order('created_at desc').paginate(page: params[:page], per_page: 5)
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
    if current_author.admin == true || current_author.name == @post.author.name
      render :edit
    else 
      flash[:alert] = "You're not the owner of this post"
      redirect_to root_path
    end
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
    @author = Author.find(params[:id])

    if @author
      author_posts = Post.where("author_id = ?", @author)
      @paginated_posts = author_posts.paginate(page: params[:page], per_page: 5)
      render :author
    else
      render file: "#{Rails.root}/public/404.html" , status: 404
    end

  end

  def about
  end

  def contact
  end

  private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :author_id)
    end

    def set_search
      if params[:search]
        @posts = Post.search(params[:search]).all.order('created_at desc').paginate(page: params[:page], per_page: 5)

        render :index
      end
    end

    def find_posts_by_author
      posts = Post.all
      @author = params[:author]
      @posts_by_author = []
      posts.each do |post|
        if post.author != nil
          if post.author.name == @author
            @post_author = post.author
            @posts_by_author << post
          end
        end
      end
      @paginated_authors = @posts_by_author.paginate(page: params[:page], per_page: 5)
    end

    def validates_author
      posts = Post.all
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

end
