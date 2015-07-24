class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @micropost = current_user.microposts.build(micropost_param)
    if @micropost.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
  
  def destroy
     @micropost = Micropost.find_by_id( params[:id])
     @micropost.destroy
     redirect_to user_path(current_user)
  end
  
  def micropost_param
    params.require(:micropost).permit(:content)
  end  
end
