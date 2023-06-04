json.id current_user.id
json.email current_user.email
json.name current_user.name
json.nickname current_user.nickname

json.avatar do
    json.id current_user.avatar.attached? ? current_user.avatar.id : nil
    json.url current_user.avatar.attached? ? Rails.application.routes.url_helpers.url_for(user.avatar) : nil
end
  