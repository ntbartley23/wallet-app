class Card < ActiveRecord::Base
	has_and_belongs_to_many :users


	validates :card_number, presence: true, uniquesness: true
	validates :expiration_month, inclusion: {in: 1..12}
	validates :expiration_year, numericality: {greater_than_or_equal_to: Time.now.year}

	 before_save : get_credit_card_type

	 def get_credit_card_type
	 	if number.starts_with?("4")
	 		self.card_type = "visa"
	 	elsif number.starts_with?("55")
	 		self.card_type ="mastercard"
	 	elsif number.starts_with?("34") || number.starts_with?("37")
	 		self.card_type = "american_express"
	 	else
	 		self.card_type = ""
	 			
	 		end
	 end		
end
