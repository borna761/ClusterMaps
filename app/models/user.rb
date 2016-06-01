class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cluster_users, dependent: :destroy
  has_many :clusters, through: :cluster_users

  def fullname
    return firstname + " " + lastname
  end

  def fullname_with_email
    return fullname + " <" + email + ">"
  end
end
