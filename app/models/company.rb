class Company < ApplicationRecord
  has_many :job_applications, dependent: :destroy
end
