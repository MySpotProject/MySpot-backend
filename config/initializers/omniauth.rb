Rails.application.config.middleware.use OmniAuth::Builder do
    provider :vkontakte, ENV['VK_API_ID'], ENV['VK_API_SECRET']
end