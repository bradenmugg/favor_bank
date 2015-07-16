class StaticPagesController < ApplicationController
  def home
    @favor = current_user.favors.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page]).per_page(10) if logged_in?
  end

  def about
  end
end
