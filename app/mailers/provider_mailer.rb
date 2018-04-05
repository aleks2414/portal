class ProviderMailer < ApplicationMailer

  default :from => 'portalredes2018@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def appointment_confirmation(appointment)
    @appointment = appointment
    mail( :to => @appointment.correo,
    :subject => 'Gracias por hacer cita con Portal de Bodas y Eventos',
    :cc => 'alex@idearialab.com' )
  end
end
