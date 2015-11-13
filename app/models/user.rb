class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :cards

    validates :fname, presence: true
    validates :lname, presence: true
    validates :email, presence: true, uniqueness:
    validates :password, presence: true, length: {minimum: 10}
    validates :phone, presence: true, inclusion: {in: 0..9}


    valdates  :email_format_should_contain_at_sign

    def email_format_should_contain_at_sign
    	if email.match (/@/).nil?
    		error.add(:email_format, "'#{email}' must contain @ sign")
    	end	
    end	
end

