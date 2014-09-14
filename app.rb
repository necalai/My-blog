require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def get_db
	@db = SQLite3::Database.new 'my_blog.db'
	@db.results_as_hash = true
	return @db
end

before do	
	get_db
end

configure do
	get_db
	@db.execute 'CREATE TABLE if not exists Posts 
	(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		content TEXT,
		create_date DATE
	)'
end   

get '/' do
	@results = @db.execute 'select * from Posts order by id desc'
  	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
  @post_txt = params[:post_txt]
  @db.execute 'insert into Posts
  (
  	content,
  	create_date
  ) values (?, datetime())', [@post_txt]

  redirect to '/'
end