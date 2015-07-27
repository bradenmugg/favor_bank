class FavorsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:destroy, :update]
    
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

  def update
    @favor = Favor.find(params[:id])
    if @favor.status == "in progress"
      @favor.update_attribute(:status, "completed")
      @favor.add_favor_points
      flash[:success] = "Favor completed"
      redirect_to root_url
    else
      @favor.update_attribute(:helper_id, current_user.id)
      @favor.update_attribute(:status, "in progress")
      flash[:success] = "Favor Accepted"
      redirect_to request.referrer || root_url
    end
  end
    
  def destroy
    @favor.destroy
    flash[:success] = "Favor deleted"
    redirect_to root_url
  end
  
  def correct_user
    @favor = current_user.favors.find_by(id: params[:id])
    redirect_to root_url if @favor.nil?
  end
  
  private

    def favor_params
      params.require(:favor).permit(:content, :favor_cost)
    end
  
end
