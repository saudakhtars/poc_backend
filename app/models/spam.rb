class Spam < ActiveRecord::Base
  validates :phone_number, presence: true
end