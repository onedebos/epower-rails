class User < ApplicationRecord
    after_initialize :init

    def init
      self.wallet  ||= 0.0  
    end
end
