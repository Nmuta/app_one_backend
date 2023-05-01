class ApiController < ApplicationController


  def data

    render json: { user: "Nmuta" }.to_json
  end

  def login
    puts "here are my params "+params['jina']
    puts "here are my params "+params['urfunguzo']

    jina = params['jina']
    urfunguzo = params['urfunguzo'];

    usr = User.find_by(email: params[:jina])
    if usr && usr.authenticatable_salt()
      is_admin = usr.is_admin?
      render json: { user: usr.email, admin:is_admin}.to_json
    else
      render json: { user: "errorz", admin: "errorz"}.to_json
    end
  end
end
