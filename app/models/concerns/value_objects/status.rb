class Status
    STATUSES = %w(inactive active).freeze

    def initialize(status)
        @status = status
    end

    def eql?(other)
        to_s.eql?(other.to_s)
    end

    def to_s
        @status.to_s
    end
end