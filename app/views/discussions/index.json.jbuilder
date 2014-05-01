json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :title, :body
  json.url discussion_url(discussion, format: :json)
end
