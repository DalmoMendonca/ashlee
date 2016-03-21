class FlairsController < ApplicationController
  before_action :set_flair, only: [:show, :edit, :update, :destroy]

  # GET /flairs
  # GET /flairs.json
  def index
    @flairs = Flair.all
  end

  # GET /flairs/1
  # GET /flairs/1.json
  def show
  end

  # GET /flairs/new
  def new
    @flair = Flair.new
  end

  # GET /flairs/1/edit
  def edit
  end

  # POST /flairs
  # POST /flairs.json
  def create
    @flair = Flair.new(flair_params)

    respond_to do |format|
      if @flair.save
        format.html { redirect_to @flair, notice: 'Flair was successfully created.' }
        format.json { render :show, status: :created, location: @flair }
      else
        format.html { render :new }
        format.json { render json: @flair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flairs/1
  # PATCH/PUT /flairs/1.json
  def update
    respond_to do |format|
      if @flair.update(flair_params)
        format.html { redirect_to @flair, notice: 'Flair was successfully updated.' }
        format.json { render :show, status: :ok, location: @flair }
      else
        format.html { render :edit }
        format.json { render json: @flair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flairs/1
  # DELETE /flairs/1.json
  def destroy
    @flair.destroy
    respond_to do |format|
      format.html { redirect_to flairs_url, notice: 'Flair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flair
      @flair = Flair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flair_params
      params.require(:flair).permit(:name, :category, :content)
    end
end
