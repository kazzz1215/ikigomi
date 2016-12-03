class AddDoneToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :done, :boolean, default: false
  end
end
