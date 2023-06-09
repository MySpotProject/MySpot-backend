json.id @spot.id
json.title @spot.title
json.description @spot.description
json.address @spot.address

json.lat @spot.lat
json.lng @spot.lng

json.coords [@spot.lat, @spot.lng]

json.pools @spot.pools
json.ramps @spot.ramps
json.rail @spot.rail
json.ladder @spot.ladder
json.slide @spot.slide

json.rating @spot.spot_ratings do |spot_rating|
    json.user_id spot_rating.user_id
    json.spot_id spot_rating.spot_id
    json.rating spot_rating.rating
end

json.comments @spot.comments do |comment|
    json.partial! "/partials/comment", comment: comment
end

json.rating_avg @spot.spot_ratings.average(:rating).to_f.round(2)

json.author do 
    # json.partial! @spot.author, as: :user
    json.partial! "/partials/user", user: @spot.author
end

json.images @spot.images do |image|
    json.url Rails.application.routes.url_helpers.url_for(image)
end
