json.array!(@models) do |model|
  json.extract! model, :id, :voupes_file, :file_name, :auto_desk_url, :content_type
  json.url model_url(model, format: :json)
end
