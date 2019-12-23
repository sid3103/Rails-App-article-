class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :attachment
      t.references :art, index: true
      t.timestamps
    end
    add_foreign_key :resumes, :arts
  end
end
