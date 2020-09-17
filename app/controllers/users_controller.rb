class UsersController < ApplicationController   
    def index
        @users = User.all
    end

    def show
        set_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end

    def edit 
        set_user
    end

    def update
        set_user
        if @user.update(user_params)
            redirect_to user_path
        else
            render :edit
        end
    end

    def delete
        set_user
        if @user.delete
            redirect_to users_path
        else
            @error = "User could not be deleted!"
        end
    end

    private

    def set_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :phone, :password, :is_admin)
    end
end
