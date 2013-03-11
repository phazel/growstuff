class Payment < ActiveRecord::Base
  attr_accessible :amount, :payer_id, :recipient_id

  belongs_to :payer, :class_name => 'Member'
  belongs_to :recipient, :class_name => 'Member'

  validates :amount, :presence => true,
    :numericality => {:greater_than_or_equal_to => 10}
end
