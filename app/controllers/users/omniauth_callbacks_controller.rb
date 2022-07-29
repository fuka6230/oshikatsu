class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!
  
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))

    if @user.persisted?
        sign_in_and_redirect @user
    else
        session["devise.user_attributes"] = @user.attributes
        redirect_to new_user_registration_url
    end
  end

  def after_sign_in_path_for(resource) 
    plans_path
  end
end