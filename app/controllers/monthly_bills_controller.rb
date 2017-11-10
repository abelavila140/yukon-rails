class MonthlyBillsController < ApplicationController
  def index
    @bill = MonthlyBill.new
    @today = Date.today.strftime("%m/%d/%Y")
    @month = params[:month] ? Date.parse(params[:month]) : Date.today
    month_start = @month.beginning_of_month
    month_end = @month.end_of_month
    @bills = MonthlyBill.where(due_date: month_start..month_end).order(:due_date)
  end

  def create 
    @bill = MonthlyBill.create(bill_params)
    if @bill.save() 
      redirect_to :back 
    else 
      redirect to monthly_bills_url
   end
  end

  def destroy
    @bill = MonthlyBill.find(params[:id])
    @bill.destroy

    redirect_to monthly_bills_url
  end

  def update
    @bill = MonthlyBill.find(params[:id])
    if @bill.update_attributes(bill_params)
      redirect_to :back
    else 
      redirect_to root_path
    end
  end

  private 
    def bill_params
        values = params.require(:monthly_bill).permit(:name, :due_date, :planned, :actual)
        date = params[:monthly_bill][:due_date]
        date = Date.strptime(date, "%m/%d/%Y") unless date == ""
        values.merge(due_date: date)
    end


end
