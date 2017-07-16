class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      t.float :price
      t.string :booking_no
      t.integer :rental_id

      t.timestamps
    end
  end
end
