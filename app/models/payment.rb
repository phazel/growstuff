class Payment < ActiveRecord::Base
  attr_accessible :amount, :paid_period_begins, :paid_period_ends, :payer_id, :recipient_id

  belongs_to :payer, :class_name => 'Member'
  belongs_to :recipient, :class_name => 'Member'
end
