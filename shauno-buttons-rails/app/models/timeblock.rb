class Timeblock < ApplicationRecord
  belongs_to :developer
  belongs_to :reason
end
