class Post < ApplicationRecord
  belongs_to :account, dependent: :destroy
end
