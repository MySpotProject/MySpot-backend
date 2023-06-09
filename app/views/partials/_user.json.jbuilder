json.id user.id
json.name user.name
json.nickname user.nickname
json.email user.email

json.score user.user_ratings.where(user_id: user.id).sum(:score)

json.avatar do
  json.id user.avatar.attached? ? user.avatar.id : nil
  json.url user.avatar.attached? ? Rails.application.routes.url_helpers.url_for(user.avatar) : nil
end
