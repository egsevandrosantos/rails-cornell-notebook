module Util
    def self.array_to_enum_hash(arr)
        arr.map { |v| Hash[*[v, v]] }.reduce Hash.new, :merge if arr.class == Array
    end
end