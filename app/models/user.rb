class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name
  # has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy


  has_many :idealizations, dependent: :destroy
  has_many :ideas, through: :categorizations

  def full_name
    if first_name || last_name
      "#{first_name.capitalize} #{last_name.capitalize}".squeeze(" ").strip
    else
      "unknown user"
    end
  end
end
