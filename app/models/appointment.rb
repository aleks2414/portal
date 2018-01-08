class Appointment < ActiveRecord::Base
  belongs_to :provider

    def resourceId
        @resourceId = 'a'
    end

    def color
    	if self.status_one == "Por confirmar"
        @color = 'red'
       else
       	@color = self.provider.color
       end
    end
end
