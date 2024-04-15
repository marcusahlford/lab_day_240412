module Company
  module PubSub
    class OutboxMessage < ApplicationRecord
      belongs_to :publisher, polymorphic: true

      scope :unpublished, -> { where(published: false) }

      def self.publish_all_unpublished
        unpublished.find_each(&:publish)
      end

      def publish
        transaction do
          update_attribute!(:sequence_number, sequence_number + 1)
          puts "Publishing message #{to_json} to GCP::PubSub"
          self.class.find_by(updated_uuid:)&.update!(published: true)
        end
      end

      private

      def to_json
        JSON.dump(key: publisher_id, sequence_number:, payload:)
      end
    end
  end
end
