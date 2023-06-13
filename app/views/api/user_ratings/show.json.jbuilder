json.array! @user_ratings do | user_rating |   
    json.id user_rating.id
    json.user_id user_rating.user_id
    json.score user_rating.score
    json.reason user_rating.reason
end
