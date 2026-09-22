class CreateJobApplications < ActiveRecord::Migration[8.1]
  def change
    create_table :job_applications do |t|
      t.string :position, null: false
      t.date :applied_on, null: false
      t.integer :status, null: false, default: 0
      t.text :notes

      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
