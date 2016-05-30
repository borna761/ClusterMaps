class ClusterUser < ActiveRecord::Base
  belongs_to :cluster
  belongs_to :user
end
