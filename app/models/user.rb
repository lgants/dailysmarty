class User < ApplicationRecord
  has_many :posts
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_defaults

  validates_presence_of :first_name, :last_name, :username

  # to prevent complications when usernames used as subdomains
  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/ }



  private

    def set_defaults
      self.role ||= 'student'
    end
end
