class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # before_filter :authenticate

  Item = Struct.new(:failure_message)

  protected

  def authenticate

    if (params.has_key?(:sb_username) && params.has_key?(:sb_key))
      @user = User.find_by_username(params[:sb_username])
      if (@user.key == params[:sb_key])
        return
      end
    end

    render :nothing => true, :status => :unauthorized

  end

end
