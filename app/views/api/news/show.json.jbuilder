json.array! @news do |news|
    json.id news.id
    json.title news.title
    json.description news.description

    json.images news.images do |image|
        json.url Rails.application.routes.url_helpers.url_for(image)
    end
        
    json.created_at news.created_at
end
