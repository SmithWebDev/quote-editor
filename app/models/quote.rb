class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  after_create_commit lambda {
                        # 'quotes' target option is the same as explicitly
                        # calling target: 'quotes'
                        broadcast_prepend_to 'quotes', partial: 'quotes/quote', locals: { quote: self }
                      }
end
