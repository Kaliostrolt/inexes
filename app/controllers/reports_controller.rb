class ReportsController < ApplicationController

 def create
    @incomes = Inex.joins(:category).where("categories.kind = 'Incomes' AND inexes.created_at > ?
AND inexes.created_at < ? AND inexes.user_id=?", params[:init_date], params[:end_date], current_user.id)
    @expenses = Inex.joins(:category).where("categories.kind = 'Expenses' AND inexes.created_at > ?
AND inexes.created_at < ? AND inexes.user_id=?", params[:init_date], params[:end_date], current_user.id)

    @in_sum = 0
    @ex_sum = 0
    @incomes.each do |incom|
      @in_sum += incom.cost
    end
    @expenses.each do |incom|
      @ex_sum += incom.cost
    end
    render 'index'
  end
end
