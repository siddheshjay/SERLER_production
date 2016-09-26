class WelcomeController < ApplicationController
    def landing
        @the_user = current_user
    end
end
