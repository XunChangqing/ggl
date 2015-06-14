json.array!(@matches) do |match|
  json.extract! match, :id, :time
  json.url match_url(match, format: :json)
end
