class Note < ApplicationRecord
  validates :body, presence: true

  after_initialize :init

  scope :by_position, ->{ order(position: :asc) }

  private

  # default the "position" to the number of records in existence.
  # (i.e. the first record will have position = 0, second 
  # will have position = 1, etc.)
  def init
    self.position = self.class.count if position.nil?
  end
end