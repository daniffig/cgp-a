class Admin::PresentationsController < Admin::BaseController
  before_action :set_presentation, only: [:show , :edit, :update, :destroy]

  # GET /admin
  def index
    authorize [:admin, Presentation]
    filter      = params[:q]
    page_number = params[:page]

    @q = policy_scope([:admin, Presentation]).ransack(filter)

    @presentations = @q.result(distinct: true).page(page_number)
  end

  # GET /admin/1
  def show
    authorize [:admin, @presentation]
  end

  # GET /admin/new
  def new
    @presentation = Presentation.new
    authorize [:admin, @presentation]
  end

  # GET /admin/1/edit
  def edit
    authorize [:admin, @presentation]
  end

  # POST /admin
  def create
    @presentation = Presentation.new(presentation_params)

    authorize [:admin, @presentation]
    if @presentation.save
      redirect_to admin_admin_presentations_url, notice: t('.notice', presentation: @presentation)
    else
      render :new
    end
  end

  # PATCH/PUT /admin/1
  def update
    authorize [:admin, @presentation]

    if @presentation.update(presentation_params)
      redirect_to admin_admin_presentations_url, notice: t('.notice', presentation: @presentation)
    else
      render :edit
    end
  end

  # DELETE /admin/1
  def destroy
    authorize [:admin, @presentation]

    if @presentation.destroy
      flash[:notice] = t('.notice', presentation: @presentation)
    else
      flash[:alert] =  @presentation.errors[:base].first
    end

    redirect_to admin_admin_presentations_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = policy_scope([:admin, Presentation]).find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.fetch(:presentation, {})
    end
end
