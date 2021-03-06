class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorised?, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.where(draft: false).order('updated_at DESC')
  end

  def admin
    @post = Post.new
    @drafts = current_user.posts.where(draft: true)
    @published = current_user.posts.where(draft: false)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: 'edit' }
      end
      format.js
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to :admin }
      format.js
    end
  end

    private
      def set_post
        @post = Post.find_by_slug(params[:slug])
      end

      def authorised?
        unless @post.user == current_user
          redirect_to root_path, notice: "Not authorised to edit this post."
        end
      end

      def post_params
        params.require(:post).permit(:title, :slug, :content, :draft)
      end
end
