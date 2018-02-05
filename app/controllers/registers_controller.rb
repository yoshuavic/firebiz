class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:show, :index]

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)

    if @register.save
      #send mail
      UserMailer.signup_confirmation(@register).deliver_later
      flash[:success] ="Registration Success, please check your inbox mail, if registration email didn't appear please check spam inbox"
      redirect_to new_register_path(@user)
    else
      render 'new'
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:first_name, :last_name, :gender, :email, :phone, :adress, :kota, :shirt)
    end

    def require_user
      if !logged_in?
          flash[:danger] = "You must sign up to show the data"
          redirect_to root_path
      end
  end
end
