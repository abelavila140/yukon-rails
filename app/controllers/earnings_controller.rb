class EarningsController < ApplicationController
  def index
    @earning = Earning.new
    @today = Date.today.strftime("%m/%d/%Y")
    @month = params[:month] ? Date.parse(params[:month]) : Date.today
    month_start = @month.beginning_of_month
    month_end = @month.end_of_month
    @earnings = Earning.where(date: month_start..month_end).order(:date)
    @total = @earnings.sum(:planned)
  end

  def create
    @earning = Earning.create(earning_params)
    if @earning.save()
        redirect_to :back
    else 
        redirect_to root_path
    end
  end

  def destroy
    @earning = Earning.find(params[:id])
    @earning.destroy

    redirect_to root_path
  end

  def update
    @earning = Earning.find(params[:id])
    if @earning.update_attributes(earning_params)
      redirect_to :back
    else 
      redirect_to root_path
    end
  end

  private 
    def earning_params
        values = params.require(:earning).permit(:name, :date, :planned, :actual)
        date = params[:earning][:date]
        date = Date.strptime(date, "%m/%d/%Y") unless date == ""
        values.merge(date: date)
    end

    def basic_params
        values = params.require(:earning).permit(:name, :date, :planned, :actual)
    end
    
end
