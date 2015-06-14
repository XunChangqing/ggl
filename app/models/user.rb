class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :event_playerships
  has_many :events, :through => :event_playerships
  has_many :player1_matches, :class_name => 'Match', foreign_key: 'player1_id'
  has_many :player2_matches, :class_name => 'Match', foreign_key: 'player1_id'
  def all_matches
    Match.where(player1_id: self.id) + Match.where(player2_id: self.id)
  end
  def all_win_matches
    @win_matches = Match.where(player1_id: self.id).select{|match|
       match.result and match.result.player1_score>match.result.player2_score}

    @win_matches+= Match.where(player2_id: self.id).select{|match|
       match.result and match.result.player1_score<match.result.player2_score}
  end
  def all_event_matches(eid)
    Match.where(player1_id: self.id, event_id: eid) + Match.where(player2_id: self.id, event_id: eid)
  end
  def all_event_win_matches(eid)
    @win_matches = Match.where(player1_id: self.id, event_id: eid).select{|match|
       match.result and match.result.player1_score>match.result.player2_score}

    @win_matches+= Match.where(player2_id: self.id, event_id: eid).select{|match|
       match.result and match.result.player1_score<match.result.player2_score}
  end

  ROLES = %w[user.user_admin user.event_admin user.result_admin user.match_admin user.news_admin user.liveroom_admin user.comment_admin]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  #ORGS = %w[org.top org.changde org.changsha]
  #validates :orgnization, presence: true
  #validates_each :orgnization do |record, attr, value|
    #record.errors.add attr, :invalid if not ORGS.include? value
  #end
end
