json.id comment.id
json.user_id comment.user_id
json.spot_id comment.spot_id
json.content comment.content
json.nickname User.find(comment.user_id).nickname
