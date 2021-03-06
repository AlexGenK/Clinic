class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category, optional: true

  validates :phone, uniqueness: true
  validates :phone, format: { with: /\A\+380[1,3-9][0-9]{8}\z/, message: 'Phone number must be in format +380yyxxxxxxx' }

  before_validation :reset_roles

  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  def will_save_change_to_email?
    false
  end

  def reset_roles
    self.user_role, self.doctor_role = false, false if self.admin_role?
    self.user_role, self.admin_role = false, false if self.doctor_role?
  end
end
