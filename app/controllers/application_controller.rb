class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  # redirect to index restaurants page after sign_in
  def after_sign_in_path_for(resource)
    restaurants_path
  end

  # redirect to index restaurants page after sign_up
  def after_sign_up_path_for(resource)
    restaurants_path
  end
end
