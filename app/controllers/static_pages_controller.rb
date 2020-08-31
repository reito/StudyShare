class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:english, :math, :physics, :chemistry]

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def english
    @microposts = Micropost.where(subject: "1").paginate(page: params[:page])
  end

  def math
    @microposts = Micropost.where(subject: "2").paginate(page: params[:page])
  end

  def physics
    @microposts = Micropost.where(subject: "3").paginate(page: params[:page])
  end

  def chemistry
    @microposts = Micropost.where(subject: "4").paginate(page: params[:page])
  end

end
