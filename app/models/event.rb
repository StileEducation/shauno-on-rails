class Event < ApplicationRecord
  belongs_to :button
  belongs_to :reason
  belongs_to :developer

  validates :button_id, presence: true
  validates :timestamp, presence: true
  validates :developer_id, presence: true
  validates :reason_id, presence: true
end
