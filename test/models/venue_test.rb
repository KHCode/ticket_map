# == Schema Information
#
# Table name: venues
#
#  id         :bigint           not null, primary key
#  name       :string
#  tm_id      :string
#  lat        :string
#  long       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class VenueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
