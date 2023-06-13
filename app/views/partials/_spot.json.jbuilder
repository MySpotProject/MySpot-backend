json.id spot.id
json.title spot.title
json.description spot.description
json.address spot.address

json.rating_avg spot.spot_ratings.average(:rating).to_f.round(2)

json.images spot.images do |image|
    json.url Rails.application.routes.url_helpers.url_for(image)
end
