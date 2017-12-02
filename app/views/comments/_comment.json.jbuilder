json.extract! comment, :id, :nombre, :mensaje, :rating, :event_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
