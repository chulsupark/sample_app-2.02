class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates_presence_of :content, :user_id
  validates_length_of   :content, :maximum => 140
  
#=begin
#  default_scope :order => 'created_at DESC'

  def self.from_users_followed_by(user)
    followed_ids = user.following.map(&:id)
    find(:all,:conditions => ["user_id IN (#{followed_ids}) OR user_id = ?", user])
  end
#=begin
=begin
#not in 2.0.2 ??
  # Return microposts from the users being followed by the given user.
  named_scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      followed_ids = user.following.map(&:id)
      { :conditions => ["user_id IN (#{followed_ids}) OR user_id = :user_id",
                        { :user_id => user }] }
    end  
=end
end
