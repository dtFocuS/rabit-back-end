class UserSerializer < ActiveModel::Serializer
  attributes :name, :username, :star_rating, :default_location
end
