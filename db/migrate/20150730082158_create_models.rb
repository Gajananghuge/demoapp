class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :voupes_file
      t.string :file_name
      t.string :auto_desk_url
      t.binary :content_type

      t.timestamps null: false
    end
  end
end
