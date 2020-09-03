class UsersController < ApplicationController

    before_action :find_user, except: [:index, :new, :edit]

    def index
        @users = User.all

        render json: @users
    end

    def profile
        render json: @user
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
