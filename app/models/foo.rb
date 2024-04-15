class Foo < ApplicationRecord
  include Company::PubSub::Publisher
end
