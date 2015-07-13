class FavorsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
    
  def create
    @favor = current_user.favors.build(favor_params)
    if @favor.save
      flash[:success] = "Favor created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @favor.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  def correct_user
    @favor = current_user.favors.find_by(id: params[:id])
    redirect_to root_url if @favor.nil?
  end
  
  private

    def favor_params
      params.require(:favor).permit(:content)
    end
  
end
