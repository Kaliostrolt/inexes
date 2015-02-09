class InexesController < ApplicationController
  before_action :set_inex, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cat_list = Category.where(user_id: current_user)
    if params[:kind] == "Incomes"
     @kind_path = new_inex_path(kind: "Incomes")
     @inexes = Inex.joins(:category).where("categories.kind = 'Incomes' AND inexes.user_id=?", current_user.id.to_s)
    elsif params[:kind] ==  "Expenses"
      @kind_path = new_inex_path(kind: "Expenses")
      @inexes = Inex.joins(:category).where("categories.kind = 'Expenses' AND inexes.user_id=?", current_user.id.to_s)
    end
    respond_with(@inexes)
  end

  def show
    @ref = URI(request.referer).query

    if @ref  == URI.encode("kind=Incomes")
      @kind_path = inexes_path(kind: "Incomes")
    elsif @ref == URI.encode("kind=Expenses")
      @kind_path = inexes_path(kind: "Expenses")
    end
  end

  def new

    if params[:kind] == "Incomes"
      @kind_path = inexes_path(kind: "Incomes")
      @cat_list = Category.where(kind: "Incomes", user_id: current_user)
    elsif params[:kind] ==  "Expenses"
      @kind_path = inexes_path(kind: "Expenses")
      @cat_list = Category.where(kind: "Expenses", user_id: current_user)
    end
    respond_with(@inex)
  end

  def edit
    @inex_cat = Category.find(@inex.category_id)
    if @inex_cat.kind == "Incomes"
      @cat_list = Category.where(kind: "Incomes", user_id: current_user)
    elsif @inex_cat.kind ==  "Expenses"
      @cat_list = Category.where(kind: "Expenses", user_id: current_user)
    end
  end

  def create
    @inex = Inex.new(inex_params)
    @inex.user_id = current_user.id if current_user
    @inex.save
    respond_with(@inex)
  end

  def update
    @inex.update(inex_params)
    respond_with(@inex)
  end

  def destroy
    @inex.destroy
    redirect_to :back
  end

  private
    def set_inex
      @inex = Inex.find(params[:id])
    end

    def inex_params
      params.require(:inex).permit(:user_id, :category_id, :name, :cost)
    end
end
