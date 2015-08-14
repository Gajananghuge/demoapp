class CreateVoueps < ActiveRecord::Migration
  def change
    create_table :voueps do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_content
      t.string :auto_desk_url

      t.timestamps null: false
    end
  end
end
