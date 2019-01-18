require 'date'

get '/' do
  file='public/gas_price.txt'
  File.readlines(file).each do |line|
    @gas_price = line
  end
  erb :index
end

get '/services' do

  erb :services
end

get '/storage' do

  erb :storage
end

get '/faq' do
  erb :faq
end

get '/contact' do

  erb :contact
end

get '/map' do
  erb :map, :layout => false
end

post '/mail' do
  require 'pony'
  Pony.mail({
    :to => 'marina@mcleodcorp.com',
    :subject => params[:subject],
    :body => params[:body] + "\n\n" + params[:name] + "\n" + params[:email] + "\n" + params[:phone],
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV["M_UNAME"],
      :password             => ENV["M_PASS"],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
  })
end