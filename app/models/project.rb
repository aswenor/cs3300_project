class Project < ApplicationRecord
    # Require title and description
    validates_presence_of :title, :description
end
