class AddNameToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :username, :string
    add_column :models, :first_name, :string
    add_column :models, :last_name, :string

  end
end
