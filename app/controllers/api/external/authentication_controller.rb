class Api::External::AuthenticationController < Api::External::ApplicationController
  include JsonWebToken

  skip_before_action :authenticate_request, only: [:login]

  def login
    # If user call this function again, it will generate a new token
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      return render json: { token: token}
    else
      return render_error_json('Unauthorized')
    end
  end
end
