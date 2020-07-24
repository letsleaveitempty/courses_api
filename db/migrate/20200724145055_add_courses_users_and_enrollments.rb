class AddCoursesUsersAndEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.timestamps
    end

    create_table :users do |t|
      t.string :email
      t.timestamps
    end

    create_table :enrollments do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.timestamps
    end
  end
end
