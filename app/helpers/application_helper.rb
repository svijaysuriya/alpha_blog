module ApplicationHelper
    def gravatar_for (user,options={size:80})
        email_add = user.email.downcase
        hash = Digest::MD5.hexdigest(email_add)
        s = options[:size]
        gravatar_src = "https://www.gravatar.com/avatar/#{hash}?s=#{s}"
        image_tag(gravatar_src,alt:user.username,class:"rounded shadow mx-auto d-block ")
    end
end
