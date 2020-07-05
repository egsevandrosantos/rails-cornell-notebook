class User < ApplicationRecord
  include Util
  enum status: Util.array_to_enum_hash(Status::STATUSES), _prefix: true
  has_many :user_confirmables
  has_secure_password

  after_create :create_user_confirmable

  validates :full_name, :email, :username, presence: true
  validates :status, inclusion: { in: Status::STATUSES }
  validates :full_name, length: { minimum: 3, maximum: 100 }
  validates :email, length: { minimum: 3, maximum: 50 }
  validates :username, :password, length: { minimum: 3, maximum: 20 }
  validates :email, :username, uniqueness: true
  validates :email, email: true

  private
  def create_user_confirmable
    self.user_confirmables.create
  end
end
