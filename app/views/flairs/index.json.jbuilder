json.array!(@flairs) do |flair|
  json.extract! flair, :id, :name, :category, :content
  json.url flair_url(flair, format: :json)
end
