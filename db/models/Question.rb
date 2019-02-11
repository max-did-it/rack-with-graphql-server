class Question
  include Mongoid::Document
  embeds_many :answers
  field :id, type: Integer
  field :hardest, type: String
  field :language, type: String
end