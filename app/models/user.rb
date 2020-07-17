class User < ApplicationRecord
    after_initialize :init

    def init
      self.wallet  ||= 0.0  
    end

    def debit_users
      users = User.all
      users.each do |user|
        user.update!(wallet: user.wallet - rand(100..300))
      end
    end

    def credit_users
      users = User.all
      users.each do |user|
        num = rand(100..300)
        user.update!(wallet: user.wallet + num)
        puts num + user.wallet
        puts num
      end
    end
end




