json.array!(@live_rooms) do |live_room|
  json.extract! live_room, :id, :name, :url
  json.url live_room_url(live_room, format: :json)
end
