class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :city, :state, :zip_code, :prefer_cost, :completed_by, :user_id, :bids

  def initialize(task_object)
    @task = task_object
  end

  def to_serialized_json
    @task.to_json(only: [:id, :name, :description, :address, :city, :state, :zip_code, :prefer_cost, :completed_by, :updated_at])
  end

end
