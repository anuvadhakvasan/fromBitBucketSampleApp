class UsersController < ApplicationController
   before_action :logged_in_user, only: [:show, :index, :destroy]
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], :per_page => 10)
  end
      
  def new
    @user = User.new
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end 
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end 
  
  
  def show
    @user = User.find(params[:id]) 
    @microposts = @user.microposts.paginate(page: params[:page], :per_page => 4) 
    @micropost = @user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 4)
  end
  
  def following
    @user = User.find(params[:id]) 
    @following =  @user.following
  end
    
  def followers
    @user = User.find(params[:id]) 
    @followers = @user.followers  
  end
  private

  def user_params
    params.require(:user).permit(:name, :email)
  end  
end
