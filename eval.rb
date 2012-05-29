require 'sinatra'
require 'stringio'

get '/' do
  erb :index
end

post '/' do
  begin
    $stdout = StringIO.new
    $stderr = StringIO.new
    @code = params[:code]
    @result = eval(@code)
  rescue Exception => e
    @exception = e
  ensure
    $stdout.rewind
    @stdout = $stdout.read
    $stderr.rewind
    @stderr = $stderr.read
  end
  erb :index
end

