class PagesController < ApplicationController
  def home_page
    redirect_to articles_path if logged_in?
  end

  def about_page
  end
  
end
