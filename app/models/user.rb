class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  # :registerable 을 주석처리하지 않으면, 회원가입이 가능하다.
  #이 웹 페이지는 모든 유저가 동등한 권한을 갖고 있기 때문에 회원가입을 제한한다.

  has_attached_file :image,
	  :defualt_url => "/images/:style/missing.png",
	  :url => ":s3_domain_url",
	  :path => "public/images/:id/:style_:basename.:extension",
	  :storage => :fog,
	  :fog_credentials => {
	  	provider: 'AWS',
	  	aws_access_key_id: "AKIAIEU6ST5X27AV47FQ",
	  	aws_secret_access_key: "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"
	  },
	  fog_directory: "portfolio-junee01-env"
end