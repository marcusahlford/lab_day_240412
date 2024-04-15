class Foo::PubSub::Serializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :updated_at
end
