class EventPlayership < ActiveRecord::Base
  belongs_to :event
  belongs_to :player, :class_name => "User"
end
