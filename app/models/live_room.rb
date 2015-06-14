class LiveRoom < ActiveRecord::Base
  has_many :match_liveroomships
  has_many :matches, :through => :match_liveroomships

  validates :name, presence: true
  validates :provider, presence: true
  validates :url, presence: true
end
