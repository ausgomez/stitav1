class AwardsController < ApplicationController
  before_action :set_award, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]

  # GET /awards
  # GET /awards.json
  #def index
  #  @awards = Award.all
  #end

  # GET /awards/1
  # GET /awards/1.json
  #def show
  #end

  # GET /awards/new
  def new
    @award = Award.new
  end

  # GET /awards/1/edit
  def edit
  end

  # POST /awards
  # POST /awards.json
  def create
    @award = Award.new(award_params)
    @member = Member.find_by(id: @award.member_id)
    respond_to do |format|
      if @award.save
        format.html { redirect_to edit_member_url(@member, :anchor => "awards"), notice: 'Award was successfully created.' }
        format.json { render :show, status: :created, location: @award }
      else
        format.html { render :new }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awards/1
  # PATCH/PUT /awards/1.json
  def update
    @member = Member.find_by(id: @award.member_id)
    respond_to do |format|
      if @award.update(award_params)
        format.html { redirect_to edit_member_url(@member, :anchor => "awards"), notice: 'Award was successfully updated.' }
        format.json { render :show, status: :ok, location: @award }
      else
        format.html { render :edit }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @member = Member.find_by(id: @award.member_id)
    @award.destroy
    respond_to do |format|
      format.html { redirect_to edit_member_url(@member, :anchor => "awards"), notice: 'Award was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_award
      @award = Award.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def award_params
      params.require(:award).permit(:name, :year, :member_id)
    end
end
