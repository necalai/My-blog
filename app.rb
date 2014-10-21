
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:my_blog.db"

class Post < ActiveRecord::Base	
	validates :username, presence: true, length: { minimum: 3 }
	validates :content, presence: true, length: { minimum: 5 }
	has_many :comments
end

class Comment < ActiveRecord::Base	
	validates :content_comm, presence: true
	belongs_to :post
end

get '/' do
	@posts = Post.order('created_at DESC')
  	erb :index
end

get '/new' do
	@p = Post.new
	erb :new
end

post '/new' do
	@p = Post.new params[:post]
	@p.datestamp = Time.now
	if @p.save 
		redirect to '/'
	else
		@error = @p.errors.full_messages.first
		return erb :new
	end	
end

get '/details/:id' do
	def func

		@post = Post.find(params[:id])	
		c = Comment.where("post_id = #{@post.id}")
		@comments = c.order('created_at DESC')

	end

	func
	erb :details
end

post '/details/:id' do
	@c = Comment.new params[:comment]
	@c.post_id = params[:id]
	@c.comment_date = Time.now

	if @c.save 
		redirect to '/details/' + @c.post_id.to_s
	else
		@error = @c.errors.full_messages.first
		func
		return erb :details
	end		
end