get '/' do
  redirect '/categories'
end

get '/categories' do
  @category_list = Category.all
  erb :index
end

get '/categories/:id' do
  category_id = params[:id]
  @category = Category.find(category_id)
  @posts = @category.posts
  erb :particular_category
end

get '/posts/:id' do
  posts_id = params[:id]
#   @category = Category.find(category_id)
  @post = Post.find(posts_id)
  erb :particular_post
end

post '/categories/:id/new' do
  category_id = params[:id]
  Post.create(title: params[:title], category_id: category_id, description: params[:description], location: params[:location], postcode: params[:postcode], email: params[:email], phone_number: params[:phone_number], poster_name: params[:poster_name], compensation: params[:compensation])
  redirect "/categories/#{category_id}"
end

put '/categories/:id/posts/:post_id' do
  @post = Post.find(params[:post_id])
  puts "Post id #{@post.id}"
  @post[:title] = params[:title]
  @post[:description] = params[:description]
  @post[:location] = params[:location]
  @post[:postcode] = params[:postcode]
  @post[:email] = params[:email]
  @post[:phone_number] = params[:phone_number]
  @post[:poster_name] = params[:poster_name]
  @post[:compensation] = params[:compensation]
  @post.save
  redirect "/categories/#{params[:id]}"
end

get '/categories/:id/posts/:post_id/edit' do
  @key = params[:key]
  @category_id = params[:id]
  @post_id = params[:post_id]
  @post = Post.find(@post_id)
  if @post.key = @key
    erb :edit
  else
    erb :invalid
  end
end