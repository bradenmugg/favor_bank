class Favor < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  after_create :deduct_favor_points
  before_destroy :return_favor_points
  
  def deduct_favor_points
    user = self.user
    user.update_attribute(:favor_points, user.favor_points - self.favor_cost)
  end
  
  def return_favor_points
    user = self.user
    user.update_attribute(:favor_points, user.favor_points + self.favor_cost)
  end
  
  def add_favor_points
    user = User.where({ id: self.helper_id }).to_a[0]
    user.update_attribute(:favor_points, user.favor_points + self.favor_cost)
  end
  
end
