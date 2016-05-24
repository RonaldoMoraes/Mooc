json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :id, :title, :user_id, :category_id, :description
  json.url tutorial_url(tutorial, format: :json)
end
