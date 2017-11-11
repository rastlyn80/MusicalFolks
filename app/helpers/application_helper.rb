module ApplicationHelper
    def avatar_url(user)
        if user.image
            "http://graph.facebook.com/#{user.uid}/picture?type=large"
        else
            gravatar_id = Digest::MD5::hexdigest(user.email).downcase            
            "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"            
        end
    end

    def active_if_on_page(target_page)
        "active" if current_page?(target_page) 
    end
end
