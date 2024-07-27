class CreateFirstJobGroups < ActiveRecord::Migration[7.1]
  def change
    JobGroup.create!(name: 'A', rate: 20)
    JobGroup.create!(name: 'B', rate: 30)
  end
end
