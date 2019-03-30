class MembersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :index]
  before_action :set_member, only: [:show, :edit, :update, :destroy, :validate_user]
  before_action :validate_user_action, only: [:edit, :update, :destroy]
  before_action :check_public, only: [:show]
  before_action :check_created_profile, only: [:new, :create]
  before_action :is_admin?, only: [:index] # only the admin can see all members in a table
  before_action :user_subscribed, only: [:new, :edit, :create, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @validate_user = validate_user
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
    # if the user is allowed to edit this profile, send notice
    flash.now[:notice] = ('You can edit this profile')
  end

  # POST /members
  # POST /members.json
  def create
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
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
      #@member.user_id = current_user.id
      respond_to do |format|
        if @member.update(member_params)
          format.html { redirect_to edit_member_url(@member), notice: 'Member was successfully updated.' }
          format.json { render :show, status: :ok, location: @member }
        else
          format.html { render :edit }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      # I want to first check if the value exists before trying to find it
      if Member.where(custom_id: params[:custom_id]).any?
        # once found a value, lets set it to the @member
        @member = Member.find_by(custom_id: params[:custom_id])
      else
        # if not we can just send a message saying that the value was not found
        redirect_to root_path, notice: 'Profile not found'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_id, :active, :fn, :ln, :phone, :email, :photo, :position_id, :about,
                                      :interests, :address, :city, :zip, :state, :linkedin, :github, :twitter, :facebook, 
                                      :instagram)
    end

    def validate_user # this just returns a true or false
      if current_user && (current_user.id == @member.user_id || current_user.admin?)
        return true
      else
        return false
      end
    end

    def validate_user_action # this just returns a true or false
      redirect_to root_path, alert: 'You do not have the rigths to edit ' + @member.fn + ' profile.' unless validate_user
    end

    def check_public
      redirect_to root_path, notice: 'This profile is not public' unless @member.active? || validate_user
    end

    def check_created_profile
      # this method checks if the current_user has already a profile created or
      # if the current_user is not admin
      redirect_to root_path, alert: 'You already have a profile created' unless current_user.members.count <= 0 || current_user.admin
    end
end
