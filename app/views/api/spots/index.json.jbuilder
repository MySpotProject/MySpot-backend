json.array! @spots do |spot|
  json.id spot.id
  json.title spot.title
  json.coords [spot.lat, spot.lng]

  json.ratings_avg spot.spot_ratings.average(:rating).to_f.round(2)
end
