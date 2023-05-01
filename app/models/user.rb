class User < ApplicationRecord

  before_create :set_default_role
  belongs_to :role, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_admin?
    role && role.id==1
  end

  private

  def set_default_role
    puts " >>>>>>> finding the role now"
    self.role ||= Role.find_by(name: "technician")
  end
end
