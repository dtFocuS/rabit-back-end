class BidSerializer < ActiveModel::Serializer
  attributes :id, :eta, :amount, :user_id, :task_id
end
