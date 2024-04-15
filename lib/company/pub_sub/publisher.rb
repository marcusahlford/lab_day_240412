module Company
  module PubSub
    module Publisher
      extend ActiveSupport::Concern

      included do
        after_save :upsert_outbox_message

        has_one :outbox_message, as: :publisher, class_name: 'Company::PubSub::OutboxMessage', dependent: :destroy
      end

      private

      def upsert_outbox_message
        outbox_message = self.outbox_message || build_outbox_message
        outbox_message.assign_attributes(
          payload: outbox_message.publisher_type.constantize::PubSub::Serializer.new(self).serializable_hash,
          published: false,
          updated_uuid: SecureRandom.uuid
        )
        outbox_message.save!
      end
    end
  end
end
