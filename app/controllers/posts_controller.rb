class PostsController < ApplicationController
before_action :find_post, only:[:show, :edit, :update, :destory ]
  def index
  end

def new
  @post = Post.new
end
def create
  @post = Post.new post_params

  if @post.save
    redirect_to @post, notice:"hello friend this not free end !"
else
render 'new', notice:"oh no "
  end
end
def show
end

def edit
end

def update
if @post.update post_params
redirect_to @post, notice: "haider !  ur articale was successfully saved !!"
else
  render 'edit'
end
def destroy
@post.destroy
respond_to do |format|
  format.html {  redirect_to posts_path }

end

end

private
def post_params
  params.required(:post).permit(:title, :content)
end
def find_post
  @post = Post.find(params[:id])
end

end
