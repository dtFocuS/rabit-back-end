class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city, :state, :prefer_cost, :completed_by
end
