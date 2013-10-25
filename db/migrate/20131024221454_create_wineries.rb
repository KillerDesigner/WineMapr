class CreateWineries < ActiveRecord::Migration
  def change
    create_table :wineries do |t|
      t.float :lon
      t.float :lat
      t.string :winery_name
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone_1
      t.string :phone_2
      t.string :phone_fax
      t.string :email
      t.string :website_url

      t.timestamps
    end
  end
end
