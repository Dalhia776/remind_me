json.array!(@events) do |event|
  json.extract! event, :id, :name, :user_id, :reminder_type, :date_due
  json.url event_url(event, format: :json)
end
