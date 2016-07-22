class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
	    @contact.request = request
	    if @contact.deliver
	      flash.now[:error] = nil
	    else
	      flash.now[:error] = '오류가 발생하여 이메일을 보낼 수 없습니다. sangjunpark0203@gmail.com 로 문의주세요.'
	      render :new
	    end
	end
end
