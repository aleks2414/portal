class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Portal de Bodas y Eventos"
    title       = "Portal de Bodas y Eventos | Guatemala"
    description = "No importa si es boda, graduación, XV años, u otro día especial. Encuentra a los mejores proveedores para eventos en Guatemala."
    image       = options[:image] || "https://obscure-springs-94763.herokuapp.com/assets/logo2-7c80afade078d60dfb2f260a70e52f6ddfdf770267b4db5d8f96592e0e906fa9.png"
    current_url = request.url
    keywords    = %w[organización-de-eventos organización-de-eventos-guatemala organización-de-bodas organización-de-bodas-guatemala organización-de-graduaciones organización-de-quince-años organización-de-xv-años vestidos-de-fiesta vestidos-de-novia vestidos-de-graduación xv-años banquetes bodas banquete novios novia ceremonia boda-civil foto-y-video renta-de-trajes pasteles-para-eventos invitaciones-para-eventos zapatos-para-eventos grupo-musical-para-eventos agencia-de-viajes cabina-de-fotos-para-eventos salón-de-belleza-para-eventos joyería tips-para-organizar-eventos ejemplos-de-bodas ejemplos-de-xv-años ejemplos-de-graduaciones organizar-primera-comunión]

    # Let's prepare a nice set of defaults
    defaults = {
      title:       title,      
      image:       image,
      revisit_after: "30 days",
      robots: "index,follow",
      distribution: "global",
      description: description,
      keywords:    keywords,
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
  # ...

end
