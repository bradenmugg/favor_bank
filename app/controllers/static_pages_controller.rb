class StaticPagesController < ApplicationController
  def home
    @favor = current_user.favors.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page]).per_page(10) if logged_in?
    @open_items = current_user.open_favors.paginate(page: params[:page]).per_page(10) if logged_in?
    @completed_items = current_user.completed_favors.paginate(page: params[:page]).per_page(10) if logged_in?
    @my_items = current_user.my_favors.paginate(page: params[:page]).per_page(10) if logged_in?
    @help_items = current_user.helper_favors.paginate(page: params[:page]).per_page(10) if logged_in?
  end

  def about
  end
end
