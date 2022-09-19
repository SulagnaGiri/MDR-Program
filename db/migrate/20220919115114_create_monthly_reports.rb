class CreateMonthlyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :monthly_reports do |t|

      t.timestamps
    end
  end
end
