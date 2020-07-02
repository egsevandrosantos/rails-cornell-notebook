class User < ApplicationRecord
  include Util
  enum status: Util.array_to_enum_hash(Status::STATUSES), _prefix: true
  has_secure_password

  validates :full_name, :email, :username, presence: true
  validates :status, inclusion: { in: Status::STATUSES }
  validates :full_name, length: { minimum: 3, maximum: 100 }
  validates :email, length: { minimum: 3, maximum: 50 }
  validates :username, :password, length: { minimum: 3, maximum: 20 }
  validates :email, :username, uniqueness: true
  validates :email, email: true

  def status
    if !@status.eql?(read_attribute(:status))
      @status = Status.new(read_attribute(:status))
    end
    @status.to_s
  end
end
