class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys, id: :uuid do |t|
      t.string :tittle
      t.datetime :begin_datetime
      t.datetime :end_datetime
      t.boolean :status

      t.timestamps
    end
  end
end
