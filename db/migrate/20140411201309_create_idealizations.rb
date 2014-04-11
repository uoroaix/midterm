class CreateIdealizations < ActiveRecord::Migration
  def change
    create_table :idealizations do |t|
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
