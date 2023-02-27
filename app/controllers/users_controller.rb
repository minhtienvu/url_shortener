class UsersController < BaseController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
    return render_data(@users, 'Get all users successfully!')
  end

  def show
    return render_data(@user, 'Get user info successfully!')
  end

  def create
    @user = User.new(user_params)

    if @user.save
      return render_data(@user, 'Create user successfully!')
    else
      return render_error(@user.errors.full_messages)
    end
  end

  def update
    unless @user.update(user_params)
      return render_error('Update user unsuccessfully!')
    end
  end

  def destroy
    if @user.destroy
      return render_data({}, 'Delete user successfully!')
    else
      return render_error('Delete user unsuccessfully!')
    end
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
    return render_error("Counldn't find user with id = #{params[:id]}") unless @user
  end
end
