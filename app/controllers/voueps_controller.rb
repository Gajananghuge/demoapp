class VouepsController < ApplicationController
  before_action :set_vouep, only: [:show, :edit, :update, :destroy]

  # GET /voueps
  # GET /voueps.json
  def index
    token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
    gon.token = token["access_token"]
    logger.info('=================================')
    logger.info(gon.token)
    @voueps = Vouep.all
  end

  # GET /voueps/1
  # GET /voueps/1.json
  def show
  end

  # GET /voueps/new
  def new
    @vouep = Vouep.new
  end

  # GET /voueps/1/edit
  def edit
  end

  # POST /voueps
  # POST /voueps.json
  def create

    @vouep = Vouep.new(vouep_params)

    token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => current_user.key, :client_secret => current_user.secret, :grant_type => 'client_credentials' }).body)
    gon.token = token["access_token"]

    respond_to do |format|
      if @vouep.save
        format.html { redirect_to '/voueps', notice: 'Vouep was successfully created.' }
        format.json { render :show, status: :created, location: @vouep }
      else
        format.html { render :new }
        format.json { render json: @vouep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voueps/1
  # PATCH/PUT /voueps/1.json
  def update
    respond_to do |format|
      if @vouep.update(vouep_params)
        format.html { redirect_to @vouep, notice: 'Vouep was successfully updated.' }
        format.json { render :show, status: :ok, location: @vouep }
      else
        format.html { render :edit }
        format.json { render json: @vouep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voueps/1
  # DELETE /voueps/1.json
  def destroy
    @vouep.destroy
    respond_to do |format|
      format.html { redirect_to voueps_url, notice: 'Vouep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vouep
      @vouep = Vouep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vouep_params
      params.require(:vouep).permit(:file)
    end
end