json.array! @spots do |spot|
    json.partial! "/partials/spot", spot: spot
end

