class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Portal de Bodas y Eventos"
    title       = "Portal de Bodas y Eventos | Guatemala"
    description = "Somos la agencia de innovación con el modelo más sólido en LATAM. Logra diferenciación y crecimiento a través de la innovación y la transformación digital."
    image       = options[:image] || "http://www.idearialab.com/assets/logo2-7c80afade078d60dfb2f260a70e52f6ddfdf770267b4db5d8f96592e0e906fa9.png"
    current_url = request.url
    keywords    = %w[agencia-de-innovación agencia-de-innovación-en-México agencia-de-innovación-en-Guatemala agencia-de-innovación-en-Perú agencia-de-innovación-en-Latinoamérica innovación modelo-de-innovación crecimiento-de-organizaciones transformación-de-organizaciones diferenciación diseño-de-nuevos-negocios suite-de-innovación estrategia-de-innovación equipo-de-innovación proceso-de-innovación cultura-de-innovación valor-para-el-cliente crecer-rentabilidad mejorar-posicionamiento ganar-participación-de-mercado proyectos-de-innovación talleres-de-innovación herramientas-de-innovación asesoría-en-innovación transformación-digital desarrollo-web desarrollo-de-apps desarrollo-de-devops desarrollo-de-plataformas-web.]

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
