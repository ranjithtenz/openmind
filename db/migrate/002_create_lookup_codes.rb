class CreateLookupCodes < ActiveRecord::Migration
  def self.up
    create_table :lookup_codes, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8', :force => true do |t|
      t.column :code_type,  :string, :limit => 30, :null => false
      t.column :short_name,  :string, :limit => 20, :null => false
      t.column :description,  :string, :limit => 50, :null => false
      t.column :sort_value, :integer, :null => false, :default => 100
      t.timestamps
      t.column :lock_version, :integer, :default => 0
    end
    
    add_index :lookup_codes, [:code_type, :short_name]
  end

  def self.down
    drop_table :lookup_codes
  end
end
