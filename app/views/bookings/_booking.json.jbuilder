json.extract! booking, :id, :user_id, :parking_spot_id, :expires_at, :released_at, :created_at, :updated_at
json.url booking_url(booking, format: :json)
