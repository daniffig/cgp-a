class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show , :edit, :update, :destroy]

  # GET /admin
  def index
    authorize [:admin, Product]
    filter      = params[:q]
    page_number = params[:page]

    @q = policy_scope([:admin, Product]).ransack(filter)

    @products = @q.result(distinct: true).page(page_number)
  end

  # GET /admin/1
  def show
    authorize [:admin, @product]
  end

  # GET /admin/new
  def new
    @product = Product.new
    authorize [:admin, @product]
  end

  # GET /admin/1/edit
  def edit
    authorize [:admin, @product]
  end

  # POST /admin
  def create
    @product = Product.new(product_params)

    authorize [:admin, @product]
    if @product.save
      redirect_to admin_admin_products_url, notice: t('.notice', product: @product)
    else
      render :new
    end
  end

  # PATCH/PUT /admin/1
  def update
    authorize [:admin, @product]

    if @product.update(product_params)
      redirect_to admin_admin_products_url, notice: t('.notice', product: @product)
    else
      render :edit
    end
  end

  # DELETE /admin/1
  def destroy
    authorize [:admin, @product]

    if @product.destroy
      flash[:notice] = t('.notice', product: @product)
    else
      flash[:alert] =  @product.errors[:base].first
    end

    redirect_to admin_admin_products_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = policy_scope([:admin, Product]).find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.fetch(:product, {})
    end
end
