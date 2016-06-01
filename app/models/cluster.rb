class Cluster < ActiveRecord::Base
  has_many :activities, dependent: :destroy

  has_many :cluster_users, dependent: :destroy
  has_many :users, through: :cluster_users
end
