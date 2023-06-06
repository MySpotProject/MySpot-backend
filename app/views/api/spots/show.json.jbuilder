json.id @spot.id
json.title @spot.title
json.description @spot.description
json.address @spot.address

json.lat @spot.lat
json.lng @spot.lng

json.coords [@spot.lat, @spot.lng]

# json.array! do
# end

# json.lnglat do
#     json.lat @spot.lat
#     json.lng @spot.lng
# end
json.pools @spot.pools
json.ramps @spot.ramps
json.rail @spot.rail
json.ladder @spot.ladder
json.slide @spot.slide

json.rating @spot.spot_ratings

json.rating_avg @spot.spot_ratings.average(:rating).to_f.round(2)

json.author do 
    # json.partial! @spot.author, as: :user
    json.partial! "/partials/user", user: @spot.author
end

json.images @spot.images do |image|
    json.url Rails.application.routes.url_helpers.url_for(image)
end
