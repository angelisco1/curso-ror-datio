json.extract! usuario, :id, :nombre, :username, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
