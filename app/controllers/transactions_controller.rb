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
    #Get all users except the current one for selecting the receiver
    @users=User.all.select { |user| user != current_user }
    @transaction = Transaction.new(transaction_params)
    #Fill the from_id transaction
    @transaction.from_id=current_user.account.id
      respond_to do |format|
        if @transaction.save && helpers.performTransaction(@transaction)
          format.html { redirect_to root_path, notice: 'Transaction was successfully created.' }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:to_id, :amount)
    end
end
