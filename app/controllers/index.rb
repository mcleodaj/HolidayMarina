require 'date'

get '/' do
  file='public/gas_price.txt'
  File.readlines(file).each do |line|
    @gas_price = line
  end

  d = DateTime.now
  if d.month >= 1
    @hours = {
              'mon' => '8AM - 7PM',
              'tues' => '8AM - 7PM',
              'wed' => '8AM - 7PM',
              'thurs' => '8AM - 4:45PM',
              'fri' => '8AM - 7PM',
              'sat' => '8AM - 8PM',
              'sun' => '8AM - 8PM'
            }
  else
    @hours = {
              'mon' => '',
              'tues' => '',
              'wed' => '',
              'thurs' => '',
              'fri' => '',
              'sat' => '',
              'sun' => ''
            }
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
  d = DateTime.now
  if d.month >= 1
    @hours = {
              'mon' => '8AM - 7PM',
              'tues' => '8AM - 7PM',
              'wed' => '8AM - 7PM',
              'thurs' => '8AM - 4:45PM',
              'fri' => '8AM - 7PM',
              'sat' => '8AM - 8PM',
              'sun' => '8AM - 8PM'
            }
  else
    @hours = {
              'mon' => '',
              'tues' => '',
              'wed' => '',
              'thurs' => '',
              'fri' => '',
              'sat' => '',
              'sun' => ''
            }
  end

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