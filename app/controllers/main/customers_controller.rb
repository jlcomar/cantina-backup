class Main::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy activate deactivate]

  # GET /customers or /customers.json
  def index
    @customers = Customer.order(:name)
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to main_customer_url(@customer), notice: "Cliente cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to main_customer_url(@customer), notice: "Cliente atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json

  def activate

    @customer.update(status: 'active') # This line updates the status of the customer to 'inactive'
    @customer.save!
    redirect_to main_customers_path
  end
  
  # PATCH /customers/1/deactivate
  def deactivate

    @customer.update(status: 'inactive') # This line updates the status of the customer to 'inactive'
    @customer.save!
    redirect_to main_customers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :matriculation)
    end
end
