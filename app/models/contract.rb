class Contract < ActiveRecord::Base
  include Entities::Mimic
  belongs_to :photographer
  validates :wedding_date, :photographer_id, :rate, presence: true
end
