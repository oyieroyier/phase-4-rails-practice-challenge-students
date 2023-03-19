class StudentSerializer < ActiveModel::Serializer
  attributes :id, :major, :name, :age
  belongs_to :instructor
end
