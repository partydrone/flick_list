class DashboardController < ApplicationController
  include Secured

  def show
    @user = session[:userinfo].info
  end
end
