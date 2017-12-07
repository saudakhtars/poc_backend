class SpamDetail < ActiveRecord::Base
  validates :spam_number, presence: true
  validates :spam_by, presence: true
end