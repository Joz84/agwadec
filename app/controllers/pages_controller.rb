class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def test
  end

  def home
  end
end
