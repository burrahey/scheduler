class WelcomeController < ApplicationController
  def home
    render body: "raw"
  end
end
