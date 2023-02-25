class AddTableLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_url
      t.date :expiration_date
      t.timestamps
    end
  end
end
