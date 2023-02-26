class UsersController < BaseController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
    return render_data(@users)
  end

  def show
    return render_data(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      return render_data(@user)
    else
      return render_error_json('Create user unsuccessfully!')
    end
  end

  def update
    unless @user.update(user_params)
      return render_error_json('Update user unsuccessfully!')
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
