module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_with_omniauth?
  end

  private

  def logged_in_with_omniauth?
    redirect_to root_path unless session['userinfo'].present?
  end
end
