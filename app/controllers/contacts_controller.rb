class ContactsController < ApplicationController

def new
	@contact = Contact.new

  prepare_meta_tags(title: "Contacto | Portal de Bodas y Eventos Guatemala",
  description: "Contáctanos! Somos realizadores de momentos únicos e inolvidables.", 
  keywords: %w[organización de eventos, organización de eventos guatemala, organización de bodas, organización de bodas guatemala, organización de graduaciones, organización de quince años, organización de xv años, vestidos de fiesta, vestidos de novia, vestidos de graduación, xv años, banquetes, bodas, banquete, novios, novia, ceremonia, boda civil, foto y video, renta de trajes, pasteles para eventos, invitaciones para eventos, zapatos para eventos, grupo musical para eventos, agencia de viajes, cabina de fotos para eventos, salón de belleza para eventos, joyería, tips para organizar eventos, ejemplos de bodas, ejemplos de xv años, ejemplos de graduaciones, organizar primera comunión]
  ) 

end

def create

    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Mensaje envíado. Gracias'
    else
      flash.now[:error] = 'Lo lamentamos, no se puede enviar el mensaje'
      render :new
    end

end

end
