# == Schema Information
#
# Table name: line_items
#
#  id                :bigint           not null, primary key
#  description       :text
#  name              :string           not null
#  quantity          :integer          not null
#  unit_price        :decimal(10, 2)   not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  line_item_date_id :bigint           not null
#
# Indexes
#
#  index_line_items_on_line_item_date_id  (line_item_date_id)
#
# Foreign Keys
#
#  fk_rails_...  (line_item_date_id => line_item_dates.id)
#
require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test '#total_price returns the total price of the line item' do
    assert_equal 250, line_items(:catering_today).total_price
  end
end
