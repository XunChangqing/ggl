class Match < ActiveRecord::Base
  #before_validation :default_values

  has_many :match_liveroomships
  has_many :live_rooms, :through => :match_liveroomships
  has_one :result
  has_many :comments

  accepts_nested_attributes_for :result
  #accepts_nested_attributes_for :match_liveroomships

  belongs_to :event
  belongs_to :player1, :class_name => "User"
  belongs_to :player2, :class_name => "User"
  #belongs_to :winner, :class_name => "Player"
  #belongs_to :winner, foregin_key: 'winner_id' :class_name => "Player"
  #def all_players
    #Player.where(id: [self.player1_id, self.player2_id])
  #end

  validates :name, presence: true
  validates :time, presence: true
  validates :event_id, presence: true
  validates :player1_id, presence: true
  validates :player2_id, presence: true

  #def winner_str
    #@winner_str
  #end

  #def winner_str= (str)
    #@winner_str = str
    #if @winner_str == 'match.winner.first'
      #winner_id = player1_id
    #end
    #if @winner_str == 'match.winner.second'
      #winner_id = player2_id
    #end
  #end

  private
  #def default_values
    #self.status ||= 'match.status.tobedone'
  #end
end
