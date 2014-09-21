class CreatePosts < ActiveRecord::Migration
  def change
  	create_table :posts do |p|  		
  		p.text :content
  		p.text :username
  		p.timestamp :datestamp

  		p.timestamps
  	end

  	create_table :comments do |t|
      t.text :post, index: true
      t.text :content_comm
      t.datetime :comment_date

      t.timestamps
  	end
  end
end
