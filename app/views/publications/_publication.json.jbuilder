json.extract! publication, :id, :titulo, :contenido, :fecha_publicacion, :ubicacion, :user_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
