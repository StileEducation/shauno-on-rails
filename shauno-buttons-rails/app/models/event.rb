class Event < ApplicationRecord
  belongs_to :button_id
  belongs_to :reason_id
  belongs_to :developer_id

  validates :button_id, presence: true
  validates :timestamp, presence: true
  validates :developer_id, presence: true
  validates :reason_id, presence: true
end
