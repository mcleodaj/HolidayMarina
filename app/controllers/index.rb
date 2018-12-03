get '/' do
  file='public/gas_price.txt'
  File.readlines(file).each do |line|
    @gas_price = line
  end
  erb :index
end

get '/about' do

  erb :about
end

get '/services' do

  erb :services
end

get '/pricing' do

  erb :pricing
end

get '/FAQ' do

  erb :FAQ
end

get '/contact' do

  erb :contact
end