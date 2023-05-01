class ApiController < ApplicationController


  def data

    render json: { user: "Nmuta" }.to_json
  end
end
