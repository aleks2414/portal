json.extract! appointment, :id, :start, :end, :provider_id, :servicio_tienda, :servicio_domicilio, :title, :evento, :correo, :telefono, :direccion, :status_one, :status_two, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
