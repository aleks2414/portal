class WelcomeController < ApplicationController
  def index
  	@events = Event.all.limit(3)
  end

  def prov
  end

  def nosotros
  	
  end

  def citas
  	@appointments = Appointment.all
  end
end
