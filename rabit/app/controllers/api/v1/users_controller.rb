class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
        users = User.all
        render json: users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        #byebug
        if @user.valid?
            render json: { user: UserSerializer.new(@user)}, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: UserSerializer.new(user)
    end
 
    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :star_rating, :address, :city, :state, :zip_code)
    end

end
