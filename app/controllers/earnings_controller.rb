class EarningsController < ApplicationController
  def index
    @earnings = Earning.all
    @earning = Earning.new
    @total = Earning.sum(:planned)
  end

  def create
    @earning = Earning.create(earning_params)
    if @earning.save()
        redirect_to root_path
    else 
        redirect_to root_path
    end
  end

  def destroy
    @earning = Earning.find(params[:id])
    @earning.destroy

    redirect_to root_path
  end

  private 
    def earning_params
        values = params.require(:earning).permit(:name, :date, :planned, :actual)
        date = params[:earning][:date]
        date = Date.strptime(date, "%m/%d/%Y") unless date == ""
        values.merge(date: date)
    end
    
end
