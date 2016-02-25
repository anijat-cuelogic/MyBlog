class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  scope :votes_up, -> (comment_id)  {where(comment_id: comment_id, value: true).count}
  scope :votes_down, -> (comment_id)  {where(comment_id: comment_id, value: false).count}
end
