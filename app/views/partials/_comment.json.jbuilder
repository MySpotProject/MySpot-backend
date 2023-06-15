json.id comment.id
json.user_id comment.user_id
json.spot_id comment.spot_id
json.content comment.content

json.partial! "/partials/user", user: comment.user

json.rating SpotRating.find_by(user_id: comment.user_id, spot_id: comment.spot_id)&.rating

json.created_at comment.created_at
