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
    if usr && usr.valid_password?(params['urfunguzo']) && usr.role
      user_role = usr.role.name
      render json: { user: usr.email, role:user_role}.to_json
    else
      render json: { user: "error", role: "error"}.to_json
    end
  end

  def all_users
    users = User.all
    mapped_users = users.map{|user| {email: user.email, id: user.id,
                                     role: user.role.name, created_at: user.created_at,
                                     updated_at: user.updated_at}}
    render json: { users: mapped_users }.to_json
  end
end
