json.id @spot.id
json.title @spot.title
json.description @spot.description
json.address @spot.address
json.lng @spot.lng
json.lat @spot.lat
json.pools @spot.pools
json.ramps @spot.ramps
json.rail @spot.rail
json.ladder @spot.ladder
json.slide @spot.slide

json.author do 
    # json.partial! @spot.author, as: :user
    json.partial! "/partials/user", user: @spot.author
end

json.images @spot.images do |image|
    json.url Rails.application.routes.url_helpers.url_for(image)
end
