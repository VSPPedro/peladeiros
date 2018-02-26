class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin || @user == current_user
      redirect_to :back, :alert => "Acesso negado. Apenas os administradores podem ver os dados dos outros usuários."
    end
  end

end
