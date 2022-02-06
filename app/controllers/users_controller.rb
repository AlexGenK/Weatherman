class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.order(:email)
    end
end
