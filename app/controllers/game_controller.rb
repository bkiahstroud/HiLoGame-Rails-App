class GameController < ApplicationController
    def try
        cookies[:number] = rand(100).to_i unless !cookies[:number].nil?
        cookies[:counter] = 0 unless cookies[:counter] != nil
        if cookies[:counter].to_i < 5
            if params[:guess].to_i == cookies[:number].to_i
                @result_string = "You got it right!"
            elsif params[:guess].to_i > cookies[:number].to_i
                @result_string = "Your guess is too high!"
                cookies[:tries].to_i + 1
            elsif params[:guess].to_i < cookies[:number].to_i
                @result_string = "Your guess is too low!"
                cookies[:tries].to_i + 1
            end
            cookies[:counter] = cookies[:counter].to_i + 1
        else
            cookies[:counter] = 0
            cookies[:number] = rand(100).to_i
            @result_string = "You have lost!"
        end
        render "try.html.erb"
    end
end
