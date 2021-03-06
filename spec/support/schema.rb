ActiveRecord::Schema.define(:version => 0) do
  create_table :experiments do |t|
    t.string :name, null: false, limit: 128
    t.datetime :start_date
    t.datetime :end_date
    t.integer :num_buckets, null: false, default: 1
    t.integer :winning_bucket
    t.text :notes, limit: 256
    t.string :population
    t.boolean :admin, null: false, default: false
    t.datetime :removed_at
    t.timestamps
  end

  add_index :experiments, :name, :unique => true
  add_index :experiments, :start_date
  add_index :experiments, :population
  add_index :experiments, :updated_at

  create_table :users, force: true do |t|
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
  end
end
