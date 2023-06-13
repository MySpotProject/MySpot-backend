json.id comment.id
json.user_id comment.user_id
json.spot_id comment.spot_id
json.content comment.content
json.nickname User.find(comment.user_id).nickname
json.created_at comment.created_at
json.updated_at comment.updated_at
