class Cluster < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  belongs_to :owner, foreign_key: 'owner_id', class_name: "User"

  has_many :cluster_users, dependent: :destroy
  has_many :users, through: :cluster_users
end
