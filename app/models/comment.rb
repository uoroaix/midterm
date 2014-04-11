class Comment < ActiveRecord::Base
  validates_presence_of :message
  belongs_to :user
  belongs_to :idea
  default_scope {order("created_at DESC")}

end
