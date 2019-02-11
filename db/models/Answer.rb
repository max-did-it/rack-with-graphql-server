class Answer
  include Mongoid::Document
  field :id, type: Integer
  field :descript, type: String
  field :truth, type: TrueClass
end