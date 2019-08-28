Rails.application.routes.draw do
  get '/hello' => 'application#hello_world'
end
