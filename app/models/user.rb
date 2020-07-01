class User < ApplicationRecord
  include Util
  enum status: Util.array_to_enum_hash(Status::STATUSES), _prefix: true
  has_secure_password

  def status
    @status ||= Status.new(read_attribute(:status))
  end
end
