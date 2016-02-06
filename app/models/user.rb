class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  # :registerable 을 주석처리하지 않으면, 회원가입이 가능하다.
  #이 웹 페이지는 모든 유저가 동등한 권한을 갖고 있기 때문에 회원가입을 제한한다.
end
