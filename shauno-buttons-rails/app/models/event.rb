class Event < ApplicationRecord
  belongs_to :button_id
  belongs_to :reason_id
  belongs_to :developer_id
end
