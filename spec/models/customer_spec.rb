require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
end
