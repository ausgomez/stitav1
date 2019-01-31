class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @users = User.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    # Find current member position
    @position = Position.find(@member.position_id)
    # Find current member experiences
    @exps = Experience.where(member_id: @member.id)
    # Find what skills does the member has
    @skills = Skill.where(member_id: @member.id)
    # Find what educations does the member has
    @educations = Education.where(member_id: @member.id)
    # Find what awards does the member has
    @awards = Award.where(member_id: @member.id)

  end

  # GET /members/new
  def new
    redirect_to(members_path, alert: 'You have no rights to CREATE a new client') unless current_user.admin?
    @member = Member.new
    @positions = Position.all
  end

  # GET /members/1/edit
  def edit
    redirect_to(members_path, alert: 'You have no rights to EDIT a new client') unless current_user.admin?
    @positions = Position.all
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
end
