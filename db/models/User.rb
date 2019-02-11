class User
  include Mongoid::Document
  field :id, type: Integer
  field :email, type: String
  field :name, type: String
  field :login, type: String
end