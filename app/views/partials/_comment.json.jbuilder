json.id comment.id
json.user_id comment.user_id
json.spot_id comment.spot_id
json.content comment.content
json.nickname User.find(comment.user_id).nickname
json.created_at comment.created_at
# json.updated_at comment.updated_at

json.avatar do
    json.id User.find(comment.user_id).avatar.attached? ? User.find(comment.user_id).avatar.id : nil
    json.url User.find(comment.user_id).avatar.attached? ? Rails.application.routes.url_helpers.url_for(User.find(comment.user_id).avatar) : nil
  end
# json.avatar User.find(comment.user_id).avatar
