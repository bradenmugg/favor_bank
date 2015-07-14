class Favor < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  after_create :update_favor_points
  
  def update_favor_points
    user = self.user
    user.update_attribute(:favor_points, user.favor_points - self.favor_cost)
  end
  
end
