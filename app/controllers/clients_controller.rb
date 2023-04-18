class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @pagy, @clients = pagy(Client.all)
    


  end

  def search
    @parameter = params[:fname].downcase
    @clients = Client.all.where("lower(fname) LIKE :search",search: "%#{@parameter}%");
    respond_to do |format|
      format.js
    end
  end


  def sortusers
    @pagy, @clients = pagy(Client.order(:fname))
    respond_to do |format|
      format.js
    end
  end
  def sortByEmail
    @pagy, @clients = pagy(Client.order(:email))
    respond_to do |format|
      format.js
    end
  end

  def check_authenciated
    if user_signed_in? == nil 
      redirect_to root_path,notice: "You need to login for that"
    end
  end
  def update_status
    @client = Client.find(params[:id])
    @client.update(status: @client.status==true ? false : true)

    respond_to do |format|
      format.js
    end
  end
  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:fname, :lname, :email, :phoneno, :status)
    end
end
