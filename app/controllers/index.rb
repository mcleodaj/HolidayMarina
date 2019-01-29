require 'date'

get '/' do
  cache_control :public, :max_age => 31536000
  file='public/gas_price.txt'
  File.readlines(file).each do |line|
    @gas_price = line
  end
  erb :index
end

get '/services' do
  cache_control :public, :max_age => 31536000
  erb :services
end

get '/storage' do  
  cache_control :public, :max_age => 31536000
  erb :storage
end

get '/faq' do
  cache_control :public, :max_age => 31536000
  erb :faq
end

get '/contact' do
  cache_control :public, :max_age => 31536000
  erb :contact
end

get '/map' do
  cache_control :public, :max_age => 31536000
  erb :map, :layout => false
end

post '/mail' do
  require 'pony'
  Pony.mail({
    :to => 'mcleodalexj@gmail.com',
    :subject => params[:subject],
    :body => params[:body] + "\n\n" + params[:name] + "\n" + params[:email] + "\n" + params[:phone],
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => 'holidaymarinainquiries@gmail.com',
      :password             => 'HolidayLKN@!',
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
  })
end