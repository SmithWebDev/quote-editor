class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  #
  # 'quotes' target option is the same as explicitly
  # calling target: 'quotes'

  # locals default value is equal to { model_name.element.to_sym => self }
  after_create_commit -> { broadcast_prepend_later_to 'quotes' }
  after_update_commit -> { broadcast_replace_later_to 'quotes' }
  after_destroy_commit -> { broadcast_remove_to 'quotes' }
end
