class Listing < ActiveRecord::Base
belongs_to :host, :class_name => "User"
belongs_to :neighborhood
has_many :reservations
has_many :reviews, through: :reservations
has_many :guests, :class_name => "User", through: :reservations


def guests
  arr = []
  Listing.all.each do |l|
    l.reservations.each do |rev|
      arr << rev.guest
    end
  end
  arr
end

end
