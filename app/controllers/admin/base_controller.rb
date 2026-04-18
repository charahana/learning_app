class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_only

  private

  def admin_only
    redirect_to root_path, alert: "権限がありません" unless current_user.admin?
  end
end