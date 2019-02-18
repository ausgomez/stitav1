class MembersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_member, only: [:show, :edit, :update, :destroy, :validate_user]
  before_action :check_public, only: [:show]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @users = User.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @validate_user = :validate_user
  end

  # GET /members/new
  def new
    redirect_to(members_path, alert: 'You have no rights to CREATE a new client') unless current_user.admin?
    @member = Member.new
    @positions = Position.all
  end

  # GET /members/1/edit
  def edit
    redirect_to(@member, alert: 'You do not have the rigths to edit ' + @member.fn + ' profile.') unless validate_user
    
  end

  # POST /members
  # POST /members.json
  def create
    if current_user.admin?
      @member = Member.new(member_params)
      @member.user_id = current_user.id
      @positions = Position.all
      # In this part I want to specify that the member being created is under the user logged in
      respond_to do |format|
        if @member.save
          format.html { redirect_to @member, notice: 'Member was successfully created.' }
          format.json { render :show, status: :created, location: @member }
        else
          format.html { render :new }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to members_path, alert: 'You have no rights to create a new member' }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    redirect_to(@member, alert: 'You do not have the rigths to edit ' + @member.fn + ' profile.') unless validate_user
    if current_user.admin?
      @member.user_id = @member.user_id
      @positions = Position.all
      respond_to do |format|
        if @member.update(member_params)
          format.html { redirect_to @member, notice: 'Member was successfully updated.' }
          format.json { render :show, status: :ok, location: @member }
        else
          format.html { render :edit }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to members_path, alert: 'You have no rights to Edit a new member' }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    redirect_to(@member, alert: 'You do not have the rigths to edit ' + @member.fn + ' profile.') unless validate_user
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_id, :active, :fn, :ln, :phone, :email, :photo, :position_id, :about,
                                      :interests, :address, :city, :zip, :state, :linkedin, :github, :twitter, :facebook, 
                                      :instagram)
    end

    def validate_user
      if current_user.id == @member.user_id || current_user.admin?
        return true
      else
        false
      end
    end

    def check_public
      #redirect_to root_path, notice: 'This profile is not public' unless @member.active? || current_user.admin? || current_user.id == @member.user_id
    end
end
