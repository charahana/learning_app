class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_only

  private

  def admin_only
    redirect_to root_path, alert: "管理者権限が必要です" unless current_user.admin?
  end
end