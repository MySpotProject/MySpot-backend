json.id @trick.id
json.title @trick.title
json.description @trick.description
json.slug @trick.slug

json.images @trick.images do |image|
    json.url Rails.application.routes.url_helpers.url_for(image)
end
