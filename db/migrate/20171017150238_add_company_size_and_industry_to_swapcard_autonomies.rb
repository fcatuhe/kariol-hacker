class AddCompanySizeAndIndustryToSwapcardAutonomies < ActiveRecord::Migration[5.1]
  def change
    add_column :swapcard_autonomies, :company_size, :string
    add_column :swapcard_autonomies, :company_industry, :string
  end
end
