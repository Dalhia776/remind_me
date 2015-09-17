class User < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :cellphone_number

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :admin?, -> {where(:admin => true)}
  has_many :events


  def full_name
    full_name = self.first_name + " " + self.last_name
  end
end
