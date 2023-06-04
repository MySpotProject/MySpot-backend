json.array! @spots do |spot|
  json.id spot.id
  json.title spot.title
  json.description spot.description
  json.address spot.address
  json.lng spot.lng
  json.lat spot.lat
  json.pools spot.pools
  json.ramps spot.ramps
  json.rail spot.rail
  json.ladder spot.ladder
  json.slide spot.slide

  # json.ratings spot.spot_ratings

  json.ratings_avg spot.spot_ratings.average(:rating).to_f.round(2)

  # json.images spot.images
  json.images spot.images do |image|
    # json.filename image.filename
    json.url Rails.application.routes.url_helpers.url_for(image)
  end

  json.created_at spot.created_at
end