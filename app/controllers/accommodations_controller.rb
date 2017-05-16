class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy,]

  # GET /accommodations
  # GET /accommodations.json
  def index
    @accommodations = Accommodation.all.paginate(:page => params[:page],:per_page => 50)
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
  end

  # GET /accommodations/new
  def new
    @accommodation = Accommodation.new
  end

  # GET /accommodations/1/edit
  def edit
  end

  # POST /accommodations
  # POST /accommodations.json
  def create
    @accommodation = Accommodation.new(accommodation_params)

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully created.' }
        format.json { render :show, status: :created, location: @accommodation }
      else
        format.html { render :new }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accommodations/1
  # PATCH/PUT /accommodations/1.json
  def update
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: 'Accommodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_by_id
    # code here
    id = params[:@accommodation][:id]
    @accommodation = Accommodation.find(id)
    render action: 'show'
  end

  def search_by_name
    # code here
    name = params[:@accommodation][:name]
    @accommodations = Accommodation.where('name LIKE ?', "%#{params[:@accommodation][:name]}%").paginate(:page => params[:page],:per_page => 50)
    render :'accommodations/index'
  end

  def search_by_country
    # code here
    @accommodations = Accommodation.joins(location: {destination: :country}).where(country: {country_id: params[:country_id]}).paginate(:page => params[:page],:per_page => 50)
    render :'accommodations/index'
  end

  def filter_results
    # code here
  end

  def remove_photo
    @accommodation = set_accommodation
    @accommodation.photo = nil
    respond_to do |format|
      if @accommodation.save
        format.html { render :edit, notice: 'Photo was successfully removed.' }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def accommodation_params
    params.require(:accommodation).permit(:location_id, :accommodation_category_id, :name, :price, :telephone, :fax, :address, :email, :web_address, :details, :description, :has_beach, :has_casino, :is_all_inclusive, :is_family_friendly, :show_email, :show_web_address, :show_listings, :qualification_level, :modified_at, :customer_id, :has_internet, :is_near_golf_course, :has_logo, :admin_contact, :admin_email, :admin_phone, :expedia_hotel_id, :country_id, :photo )
  end
end
