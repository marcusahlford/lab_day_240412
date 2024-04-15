class Bar < ApplicationRecord
  include Company::PubSub::Publisher
end
