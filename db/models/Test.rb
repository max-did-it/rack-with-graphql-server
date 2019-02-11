class Test
  include Mongoid::Document
  embeds_many :questions
  field :id, type: Integer
  field :language, type: String
  field :hardest, type: String
end