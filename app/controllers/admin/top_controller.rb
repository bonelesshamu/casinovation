class Admin::TopController < ApplicationController
  def index
    p "hoge"
    render action: 'index'
  end
end
