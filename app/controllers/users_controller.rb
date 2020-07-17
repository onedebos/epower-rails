class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy, :credit_user, :debit_user, :withdraw, :deposit]
  before_action :withdrawal_amt, only: [:withdraw]

  
  # GET /users.json
  def index # list users in descending order by balance
    @users = User.all.order(wallet: :desc)
    render json: {
      users: @users
    }
  end



  
  # GET /users/1.json
  def show
    render json: {
      user: @user
    }
  end

  # PUT /user/withdraw/:id
  def withdraw
    old_balance = @user.wallet
    if old_balance - @withdrawal_amt < 0
      return render json: {
        error: "INSUFFICIENT_BALANCE"
      }
    end
    if @user.update!(wallet: @user.wallet - @withdrawal_amt)
      render json: { 
        name: @user.name,
        id: @user.id,
        old_balance: old_balance,
        withdrawal_amt: @withdrawal_amt,
        new_balance: @user.wallet
      }
    else
      render json: {
        error: "CAN'T WITHDRAW"
      }
    end
  end

  # PUT /user/deposit/:id
  def deposit
    old_balance = @user.wallet
    if @user.update!(wallet: @user.wallet + params[:deposit_amt])
      render json: { 
        name: @user.name,
        id: @user.id,
        old_balance: old_balance,
        deposit_amt: params[:deposit_amt],
        new_balance: @user.wallet
      }
    else
      render json: {
        error: "CAN'T DEPOSIT"
      }, status: 400
    end
  end


  # POST /users.json
  def create
    @user = User.create(user_params)
    if @user
      render json: {user: @user}
    else
      render json: {error: "CAN'T CREATE USER"}, status: 400
    end
  end


  # PUT /user/credituser/:id
  def credit_user
    random_amt = rand(200..9999)
    old_amt = @user.wallet
    if @user.update!(wallet: @user.wallet + random_amt)
      render json: {name: @user.name,  old_balance: old_amt, credit_amt: random_amt, wallet_balance: @user.wallet}
    else
      render json: {error: "CAN'T CREDIT USER"}, status: 400
    end
  end

  # PUT /user/debituser/:id
  def debit_user
    random_amt = rand(100...999)
    old_amt = @user.wallet
    if old_amt - random_amt < 0
      return render json: {
        error: "INSUFFICIENT_BALANCE"
      }
    end
    if @user.update!(wallet: @user.wallet - random_amt)
      render json: {name: @user.name, wallet_balance: @user.wallet, old_balance: old_amt, debit_amt: random_amt}
    else
      render json: {error: "CAN'T DEBIT USER"}, status:400
    end
  end

  def find_user_by_name
    user = User.find_by_name(params[:name])
    if user
      render json: {
        user: user
      }
    else
      render json: {
        error: "NO USER FOUND WITH THAT NAME"
      }
    end
  end

  def users_with_balance_above_amt
    users = User.where("wallet >= :amt", {amt: params[:amt]})
    render json: {users: users}
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def withdrawal_amt
      @withdrawal_amt = params[:withdrawal]
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :wallet, :withdrawal, :deposit_amt, :user_name)
    end
end
