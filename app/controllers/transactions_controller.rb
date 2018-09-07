class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transaction=Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @users=User.all.select { |user| user != current_user }
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @users=User.all.select { |user| user != current_user }
    @transaction = Transaction.new(transaction_params)
    @transaction.from_id=current_user.account.id

    respond_to do |format|
      if performTransaction
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def performTransaction
      ActiveRecord::Base.transaction do
        if @transaction.from_id.nil? || @transaction.to_id.nil?
          @transaction.errors.add(:user, "cannot be nil.")
          return false
        end
        from_account=Account.find(@transaction.from_id)
        to_account=Account.find(@transaction.to_id)

        if from_account.balance<@transaction.amount
          @transaction.errors.add(:amount, "is too high for your current balance.")
          return false
        else
          from_account.balance=from_account.balance-@transaction.amount
          from_account.save
          to_account.balance=to_account.balance+@transaction.amount
          to_account.save
          @transaction.save
          return true
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:to_id, :amount)
    end
end
