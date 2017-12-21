json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :title
  json.start appointment.start
  json.end appointment.end
  json.resourceId appointment.resourceId
  json.color appointment.color
  json.url provider_appointment_url(@provider,appointment, format: :html)
end