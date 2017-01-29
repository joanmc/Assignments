class MysiteController < ApplicationController
  def home
    @posts = Post.all
  end

  def post_new
    if request.post?
      @entry = Post.create({:author => params[:author], :title =>  params[:title], :text =>  params[:text], :created_date => Time.now })
      flash[:success] = 'Post Saved'
      redirect_to(:action => 'home')
    end
  end

  def post_detail
    @post = Post.find(params[:id])
  end

  def post_edit
    @post = Post.find(params[:id])

  end

  def post_update
    @post = Post.find(params[:id])
    @post.update({:author => params[:post][:author], :title =>  params[:post][:title], :text =>  params[:post][:text]})

    if @post.save!
      flash[:success] = 'Post Updated'
      redirect_to(:action => "home")
    else
      render action: 'post_edit'
    end
  end

  def post_delete
    @post = Post.find(params[:id]).destroy
    flash[:success] = 'Post Deleted'
    redirect_to(:action => "home")
  end
end
