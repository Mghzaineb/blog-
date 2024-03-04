class CreateArticlees < ActiveRecord::Migration[6.0]
  def change
    create_table :articlees do |t|

      t.timestamps
    end
  end
end
