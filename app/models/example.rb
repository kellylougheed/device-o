class Example < ActiveRecord::Base
  validates :text, presence: true, length: { minimum: 10 }
  validates :device, presence: true
end