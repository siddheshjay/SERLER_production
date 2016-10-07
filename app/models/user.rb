class User < ApplicationRecord

  has_many :papers
  has_many :notifications
  has_many :news, through: :notifications

  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %i[user moderator analyst administrator]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    ROLES.include?(role)
  end
  
  def check_role?(role)
    puts 'xxxxxxxxxxxxxxx'
    puts roles_mask
    puts 2**ROLES.index(role)
    not ((roles_mask.to_i || 0) & 2**ROLES.index(role)).zero?
  end
end
