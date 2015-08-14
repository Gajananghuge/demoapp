json.array!(@voueps) do |vouep|
  json.extract! vouep, :id, :filename, :content_type, :file_content, :auto_desk_url
  json.url vouep_url(vouep, format: :json)
end
