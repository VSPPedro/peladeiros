class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @admins = User.all.select{ |user| user.admin == true && user.approved == true }.sort_by {|user| user.name}
    @users = User.all.select{ |user| user.approved == true && user.admin != true }.sort_by {|user| user.name}
    @pending_users = User.all.select{ |user| user.approved == false}.sort_by {|user| user.name}
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin || @user == current_user
      redirect_to :back, :alert => "Acesso negado. Apenas os administradores podem ver os dados de outros usuários."
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params.require(:user).permit(:name, :campus, :approved))
        format.html { redirect_to @user, notice: 'Usuário foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
