class Contact < MailForm::Base

	attribute :name, 					:validate => false
	attribute :email, 				:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :phone,     		:validate => false
	attribute :provider,   		:validate => false
	attribute :city,    			:validate => false
	attribute :event,    			:validate => false
	attribute :rol,    			  :validate => false
	attribute :date,    			:validate => false
	attribute :comments, 			:validate => false
	attribute :nickname, 			:captcha => true

def headers 
	{
	:subject => "Contacto Portal",
	:to => "alex@idearialab.com",
	:cc => "rebecaayala1994@gmail.com",
	:from => %("#{name}" <#{email}>)
	}
	end
end