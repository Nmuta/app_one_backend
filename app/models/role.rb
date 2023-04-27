class Role < ApplicationRecord
  has_many :users

  def admin?
    Role.where(name: admin).first
  end
end
