class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :grouped_contacts
  has_many :groups, through: :grouped_contacts 

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  
  def friendly_created_at
    created_at.strftime('%A, %d %b %Y %l:%M %p')
  end

  def full_name
    first_name + " " + last_name
  end

  def self.find_all_johns
    Contact.where(first_name: "John") #finds all Johns
    #Contact.find_by(first_name: "John") only finds one instance of John.
  end
    
  def japan_phone_code
    "(81) " + phone_number
  end 
end
