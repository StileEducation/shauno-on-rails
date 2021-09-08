class TimeblockMapping < ApplicationRecord
  belongs_to :timeblock
  belongs_to :event
end
