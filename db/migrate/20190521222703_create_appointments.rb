class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :appointment_date
      t.string :appointment_time
      t.belongs_to :user, foreign_key: true
      t.belongs_to :doctor, foreign_key: true

      t.timestamps
    end
  end
end
