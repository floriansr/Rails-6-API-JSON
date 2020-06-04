class Api::V1::ImagesController < Api::ApiController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_image, only: %i[show update destroy]

  def index
    @images = Image.all
    render json: @images
  end

  def show
    render json: @image
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      render json: @image, status: :created, location: api_v1_images_url(@image)
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @image.destroy
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:stream, :extension, :description).merge(user_id: current_user.id)
    end
end