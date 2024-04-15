class CreatePubSubOutboxMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :pub_sub_outbox_messages do |t|
      t.references :publisher, polymorphic: true, null: false
      t.json :payload, null: false
      t.boolean :published, null: false
      t.integer :sequence_number, default: 0, null: false
      t.uuid :updated_uuid, null: false

      t.timestamps null: false

      t.index %i[publisher_type publisher_id], unique: true
      t.index :published
      t.index :updated_uuid, unique: true
    end
  end
end
