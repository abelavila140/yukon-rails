class Earning < ApplicationRecord
  after_initialize :init

  def init
    self.planned ||= 0.00
  end
end
