class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  #
  # 'quotes' target option is the same as explicitly
  # calling target: 'quotes'

  # locals default value is equal to { model_name.element.to_sym => self }
  after_create_commit lambda {
                        broadcast_prepend_to 'quotes'
                      }
end
