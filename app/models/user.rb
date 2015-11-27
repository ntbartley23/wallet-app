class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :cards

    validates_presence_of :fname, :lname
    
    validates_uniqueness_of :email
    validates :password, confirmation: true, length: {minimum: 10}
    validates :phone, presence: true, inclusion: {:in => 0..9}


    validates :email_should_contain_at_sign

    def email_should_contain_at_sign
    	if email.match (/@/).nil?
    		error.add(:email, "'#{email}' must contain @ sign")
    	end	

	end



end