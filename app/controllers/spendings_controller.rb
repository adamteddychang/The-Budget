class SpendingsController < ApplicationController
  def new
    @user = User.where(user_id: current_user.id)

    @group = Group.find(params[:group_id])
    @spending = Spending.new
  end

  def create
    @group = Group.find(params[:group_id])
    @spendings = @group.spendings.create(name: spending_params[:name], amount: spending_params[:amount],
      user_id: current_user.id, group_id: @group.id)
    if @spendings.save
      flash[:notice] = 'Spending Created!'
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @spending = Spending.find(params[:id])
    authorize! :destroy, @spending
    flash[:notice] = if @spending.destroy
                       'Transaction removed successfully'
                     else
                       'Something went wrong'
                     end
    redirect_to root_path
  end

  private

  def spending_params
    params.require(:spending).permit(:name, :amount)
  end
end
