class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:update, :destroy, :edit]

    def index
        @users = User.order(:email)
    end

    def destroy
        if User.count <= 1
          flash[:alert] = 'Невозможно удалить последнего пользователя'
        else
            @user.destroy
        end
        redirect_to users_path, status: 303
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
