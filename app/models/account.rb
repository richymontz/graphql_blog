class Account < ApplicationRecord
  attr_accessor :token

  enum account_role: {
    individual: "individual",
    company: "company"
  }

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, email: true, presence: true
  validates :date_of_birth, presence: true, if: :individual?
  validates :company_number, presence: true, if: :company?
end
