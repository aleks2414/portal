# Preview all emails at http://localhost:3000/rails/mailers/provider_mailer
class ProviderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/provider_mailer/appointment_confirmation
  def appointment_confirmation
    ProviderMailer.appointment_confirmation
  end

end
