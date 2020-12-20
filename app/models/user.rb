class User < ApplicationRecord
  filterrific(
    available_filters: [
      :search_query
    ]
  )

  scope :search_query, lambda { |users|
    where("first_name ILIKE :keyword", { keyword: "%#{users}%" })
    .or(where("last_name ILIKE :keyword", { keyword: "%#{users}%" }))
    .or(where("email ILIKE :keyword", { keyword: "%#{users}%" }))
    .or(where("address ILIKE :keyword", { keyword: "%#{users}%" }))
  }

  def full_name
    "#{first_name} #{last_name}"
  end

  def decorated_created_at
    created_at.strftime("%d %b %Y, %H:%M")
  end
end
