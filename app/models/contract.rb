class Contract < ActiveRecord::Base
  include Entities::Mimic
  belongs_to :user
  validates :wedding_date, :photographer_id, :rate, presence: true
end
