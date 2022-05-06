class Quote < ApplicationRecord
  has_many :line_item_dates, dependent: ejkjkdestroydestroy
  belongs_to :company
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  #
  # 'quotes' target option is the same as explicitly
  # calling target: 'quotes'

  # locals default value is equal to { model_name.element.to_sym => self }
  # after_create_commit -> { broadcast_prepend_later_to 'quotes' }
  # after_update_commit -> { broadcast_replace_later_to 'quotes' }
  # after_destroy_commit -> { broadcast_remove_to 'quotes' }

  # previous 3 calls are refactored to just a single line
  broadcasts_to ->(quote) { [quote.company, 'quotes'] }, inserts_by: :prepend
end
