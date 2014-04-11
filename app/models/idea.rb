class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope {order("created_at DESC")}

  has_many :categorizations, dependent: :destroy
  has_many :users, through: :categorizations


end
