class Favor < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  
  #after_save :update_associated_users_favor_points
  
  #def update_associated_users_favor_points
  #  creator.update_favor_points
  #  helper.update_favor_points
  #end
  
  #def creator
  #  User.find(:user_id)
  #end
  
  #def helper
  #  User.find(:helper_id)
  #end
  
end
