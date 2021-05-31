class RegistrationsController < Devise::RegistrationsController
  
  def update 
    @user.update(account_update_params)
  end
  private
  def sign_up_params
    params.require(:user).permit(:username, :fullname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :fullname, :email, :password, :password_confirmation,
                                 :photo)
    
  end
end
