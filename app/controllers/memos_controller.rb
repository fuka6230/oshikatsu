class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit]

  def index
    @memos = current_user.memos
  end

  def to_index
    redirect_to action: :index
  end
  

  def show
  end

  def new
    @memo = Memo.new
    @tag_memo_names = current_user.tag_memos.pluck(:name)
  end

  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.name.blank?
      redirect_to ({action: :new}), alert: "タイトルは必須項目です。"
    else
      if @memo.save
        redirect_to @memo, notice: "「#{@memo.name}」を登録しました。"
       else
        redirect_to ({action: :new}), alert: "エラーが発生しました。"
       end      
    end
  end   

  def edit
    @tag_memo_names = current_user.tag_memos.pluck(:name)
  end
  
  def update
    memo = current_user.memos.find(params[:id])
    memo.update!(memo_params)
    redirect_to memos_url, notice: "「#{memo.name}」を更新しました。"
  end

  def destroy
    memo = current_user.memos.find(params[:id])
    memo.destroy
    redirect_to memos_url, notice: "「#{memo.name}」を削除しました。"
  end

  private

  def memo_params
    params.require(:memo).permit(:name, :description, :tag_memo, :image)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
  end
end
