class Event < ActiveRecord::Base
  has_many :event_playerships
  has_many :players, :through => :event_playerships
  has_many :matches
end
