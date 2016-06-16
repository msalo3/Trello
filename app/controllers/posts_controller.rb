class PostsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @posts = Post.all.order(sort: :asc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end

  def order
    puts params[:myOrder]

    ourData = params[:myOrder]
    puts ourData
    ourData.each_with_index do |id, i|
      @post = Post.find(id)
      @post.sort = (i+1)
      @post.save
    end

    render :json => { }, :status => 200
  end

  def ordertest
    puts params
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
