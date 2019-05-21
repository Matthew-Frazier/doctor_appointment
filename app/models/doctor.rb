class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
