module Company
  module PubSub
    def self.publish
      OutboxMessage.publish_all_unpublished
    end

    def self.table_name_prefix
      "pub_sub_"
    end
  end
end
