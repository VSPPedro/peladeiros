class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @admins = User.all.select{ |user| user.admin == true }.sort_by {|user| user.name}
    @users = User.all.select{ |user| user.approved == true && user.admin != true }.sort_by {|user| user.name}
    @pending_users = User.all.select{ |user| user.approved == false}.sort_by {|user| user.name}
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin || @user == current_user
      redirect_to :back, :alert => "Acesso negado. Apenas os administradores podem ver os dados de outros usuários."
    end
  end

end
