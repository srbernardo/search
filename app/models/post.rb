class Post < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_all_fields,
    against: [ :title, :content ],
    using: {
      tsearch: { prefix: true }
    }

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 500 }
end
