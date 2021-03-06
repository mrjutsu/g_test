class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :set_messages]
  before_action :set_messages, only: :show

  def index
    @categories = Category.all.order(:name)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_path(@category.slug), notice: 'Categoría creada exitosamente' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Categoría editada exitosamente' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Categoría destruida' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    def set_messages
      @messages = @category.messages.order(created_at: :desc)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end
