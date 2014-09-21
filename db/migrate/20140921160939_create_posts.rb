class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |p|
  		p.text :name
  		p.text :content
  		p.text :username

  		p.timestamps
  	end
  end
end
