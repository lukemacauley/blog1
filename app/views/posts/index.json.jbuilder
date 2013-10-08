json.array!(@posts) do |post|
  json.extract! post, :title, :slug, :content, :draft
  json.url post_url(post, format: :json)
end
