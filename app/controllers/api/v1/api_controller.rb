class Api::V1::ApiController < ApplicationController
  # check for user authentication
  def check_api_key
    if params[:api_key]
      @user = User.find_by(api_key: params[:api_key])
      if @user.nil?
        render 'api/v1/errors/user_error.json.rabl'
      end
    else
      render 'api/v1/errors/api_error.json.rabl'
    end
  end
end
