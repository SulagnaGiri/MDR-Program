class CreateDailyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_reports do |t|

      t.timestamps
    end
  end
end
