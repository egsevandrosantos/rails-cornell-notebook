class UserConfirmable < ApplicationRecord
  include Util
  enum confirmable_kind: Util.array_to_enum_hash(ConfirmableKind::KINDS), _prefix: true
  belongs_to :user
  has_secure_token :confirmable_token

  validates :kind, inclusion: { in: ConfirmableKind::KINDS }
  validates :user_id, presence: true
end
