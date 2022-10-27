class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit]
  skip_before_action :check_logged_in, only: :index
  
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
    begin
      @tag_names = current_user.tags.pluck(:name) 
    rescue
      @tag_names = :no_tags
    end
  end

  def edit
    @tag_names = current_user.tags.pluck(:name)
  end

  def update
    plan = current_user.plans.find(params[:id])
    @tag_names = current_user.tags.pluck(:name)
    if plan.name.blank?
      flash.now[:alert] = "タイトルは必須項目です。"
      render action: :new
    elsif plan.start_time.blank?
      flash.now[:alert] = "日時は必須項目です。"
      render action: :new 
    else  
      plan.update!(plan_params)
      redirect_to plans_url, notice: "「#{plan.name}」を更新しました。"
    end
  end

  def destroy
    plan = current_user.plans.find(params[:id])
    plan.destroy
    redirect_to plans_url, notice: "「#{plan.name}」を削除しました。"
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.name.blank?
      render :new, alert: "タイトルは必須項目です。"
    elsif @plan.start_time.blank?
      render action: :new, alert: "日時は必須項目です。"
    else
      if @plan.save
          redirect_to @plan, notice: "「#{@plan.name}」を登録しました。"
      else
        redirect_to ({action: :new}), alert: "エラーが発生しました。"
      end
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :start_time, :end_time, :tag, :countdown)
  end

  def set_plan
    @plan = current_user.plans.find(params[:id])
  end
end
