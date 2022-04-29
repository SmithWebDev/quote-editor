class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  after_create_commit lambda {
                        broadcast_prepend_to 'quotes', partial: 'quotes/quote', locals: { quotes: self },
                                                       target: 'quotes'
                      }
end
