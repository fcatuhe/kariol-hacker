class CreateSwapcardAutonomies < ActiveRecord::Migration[5.1]
  def change
    create_table :swapcard_autonomies do |t|
      t.string :sc_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :second_job_title
      t.string :photo_thumbnail
      t.text :biography
      t.string :organization
      t.string :email
      t.string :website_url
      t.string :company_name

      t.timestamps
    end
  end
end
