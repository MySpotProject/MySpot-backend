json.array! @users do | user |
    json.partial! "/partials/user", user: user
end
