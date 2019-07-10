class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :star_rating, :default_location, :tasks

  # def initialize(user_object)
  #   @user = user_object
  # end

  # def to_serialized_json
  #   @user.to_json(:include => {
  #     :tasks => {:only => [:id, :name, :description, :address, :city, :state, :zip_code, :prefer_cost, :completed_by, :user_id, :updated_at]}
  #   }, :except => [:updated_at])
  # end
end
