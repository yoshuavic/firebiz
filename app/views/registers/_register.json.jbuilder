json.extract! register, :id, :first_name, :last_name, :gender, :email, :phone, :shirt, :created_at, :updated_at
json.url register_url(register, format: :json)
