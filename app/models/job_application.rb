class JobApplication < ApplicationRecord
  belongs_to :company
  belongs_to :user

  enum status: { applied: 0, interviewing: 1, offered: 2, rejected: 3 }
end
