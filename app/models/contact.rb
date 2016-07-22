class Contact < MailForm::Base
	attribute :name,      :validate => true
	attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message,   :validate => true
	attribute :nickname,  :captcha  => true

	def headers 
		{
		  	:subject => "포트폴리오 사이트에서 보낸 문의 메일입니다.",
		  	:to => "sangjunpark0203@gmail.com",
		  	:from => %("#{name}" <#{email}>)
		}
	end
end