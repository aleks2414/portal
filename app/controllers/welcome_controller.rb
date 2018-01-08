class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:citas, :por_confirmar]
  def index
  	@events = Event.all.limit(3)
  end

  def prov
  end

  def nosotros
  
  prepare_meta_tags(title: "Nosotros | Portal de Bodas y Eventos Guatemala",
  description: "Somos el Portal de Bodas y Eventos líder en la organización de eventos en Guatemala.", 
  keywords: %w[organización de eventos, organización de eventos guatemala, organización de bodas, organización de bodas guatemala, organización de graduaciones, organización de quince años, organización de xv años, vestidos de fiesta, vestidos de novia, vestidos de graduación, xv años, banquetes, bodas, banquete, novios, novia, ceremonia, boda civil, foto y video, renta de trajes, pasteles para eventos, invitaciones para eventos, zapatos para eventos, grupo musical para eventos, agencia de viajes, cabina de fotos para eventos, salón de belleza para eventos, joyería, tips para organizar eventos, ejemplos de bodas, ejemplos de xv años, ejemplos de graduaciones, organizar primera comunión]
  ) 
  	
  end

  def citas
  	@appointments = Appointment.all
    @providers = Provider.all
  end

  def por_confirmar
    @providers = Provider.all
    @appointments = Appointment.where(status_one: "Por confirmar").paginate(:page => params[:page], :per_page => 20)
  end
end
