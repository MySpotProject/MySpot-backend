json.partial! "/partials/user", user: @user

json.vk current_user.vk
json.tg current_user.tg
json.mail current_user.mail
