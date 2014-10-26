class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |t|  		
  		t.text :content
  		t.text :username
  		t.timestamp :datestamp
		
  		t.timestamps
  	end

  	create_table :comments do |t|
      t.belongs_to :post, index: true
      t.text :content_comm
      t.datetime :comment_date

      t.timestamps
  	end
  end
end
