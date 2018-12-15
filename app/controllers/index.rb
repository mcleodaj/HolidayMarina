require 'date'

get '/' do
  file='public/gas_price.txt'
  File.readlines(file).each do |line|
    @gas_price = line
  end

  d = DateTime.now
  if d.month >= 10
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
  puts @hours["mon"]
  erb :index
end

get '/about' do

  erb :about
end

get '/services' do

  erb :services
end

get '/storage' do

  erb :storage
end

get '/FAQ' do

  erb :FAQ
end

get '/contact' do

  erb :contact
end