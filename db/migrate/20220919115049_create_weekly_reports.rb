class CreateWeeklyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_reports do |t|

      t.timestamps
    end
  end
end
