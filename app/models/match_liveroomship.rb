class MatchLiveroomship < ActiveRecord::Base
  belongs_to :match
  belongs_to :live_room
  #accepts_nested_attributes_for :live_room, :reject_if => :all_blank
end
