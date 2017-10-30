Rails.application.routes.draw do
    get '/game' => 'game#try'
    get '/game/:guess' => 'game#try'
end
