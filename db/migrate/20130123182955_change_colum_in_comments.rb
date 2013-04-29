class ChangeColumInComments < ActiveRecord::Migration
  def up
  	rename_column :comments, :prot_c_def, :prot_c_deficiency
  	rename_column :comments, :prot_s_def, :prot_s_deficiency
  end

  def down
  end
end
