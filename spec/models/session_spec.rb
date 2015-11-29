require 'rails_helper'

RSpec.describe Session, type: :model do
  it { should have_db_column(:rate).of_type(:integer) }
  it { should have_db_column(:wedding_date).of_type(:date) }
  it { should have_db_column(:photographer_id).of_type(:integer) }
  it { should have_db_column(:customer_id).of_type(:integer) }

  it { should belong_to(:photographer) }
end
