Dir[Rails.root.join('app/models/concerns/**/*.rb')].each { |f| require f }

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
