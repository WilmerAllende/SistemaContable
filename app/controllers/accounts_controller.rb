class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    search = params[:term].present? ? params[:term] : nil
    @accounts = if search
      buscar = "%#{search}%"
      #Account.where("codigo LIKE ? OR name LIKE ?",buscar,buscar)
      #Account.search(search)
      Account.search "#{search}", page: params[:page], per_page: 4
    else
      Account.limit(5).page params[:page]
    end
  end

  def autocomplete
    render json: Account.search(params[:query], {
      fields: ["codigo", "name"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account}
        flash[:notice] = "Cuenta creado con exito"
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        flash[:alert] = "Cuenta no creado"
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account }
        flash[:notice] = "Cuenta modificado con exito"
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url }
      flash[:notice] = "Cuenta eliminada con exito"
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:codigo, :name)
    end
end
