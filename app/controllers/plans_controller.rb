class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit]
  def index
    @q = current_user.plans.ransack(params[:q])
    @plans = @q.result(distinct: true)
  end

  def to_index
    redirect_to :action => :index
  end
  
  def show
  end

  def new
    @plan = Plan.new
    @tag_names = current_user.tags.pluck(:name) 
  end

  def edit
    @tag_names = current_user.tags.pluck(:name)
  end

  def update
    plan = current_user.plans.find(params[:id])
    plan.update!(plan_params)
    redirect_to plans_url, notice: "「#{plan.name}」を更新しました。"
  end

  def destroy
    plan = current_user.plans.find(params[:id])
    plan.destroy
    redirect_to plans_url, notice: "「#{plan.name}」を削除しました。"
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
        redirect_to @plan, notice: "「#{@plan.name}」を登録しました。"
    else
      render :new
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :start_time, :end_time, :tag)
  end

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end
end
