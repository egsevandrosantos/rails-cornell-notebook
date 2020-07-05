class ConfirmableKind
    KINDS = %w(confirm_account reset_password).freeze

    def initialize(kind)
        @kind = kind
    end

    def eql?(other)
        to_s.eql?(other.to_s)
    end

    def to_s
        @kind.to_s
    end
end