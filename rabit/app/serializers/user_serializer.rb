class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :username, :star_rating, :default_location
end
