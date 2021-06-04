module UsersHelper
    def profile_photo(user)
        if @user.photo.attached? 
            img src="<%= url_for(@user.photo)
         else 
         
        gravatar_image_tag(current_user.email, size: 64, alt: current_user.username)
        end

        
    end
end
