class MemosController < ApplicationController
  def index
    @memos = current_user.memos
  end

  def show
    @memo = current_user.memos.find(params[:id])
  end

  def new
    @memo = Memo.new
    @tag_memo_names = current_user.tag_for_memos.pluck(:name)
  end

  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save
        redirect_to memos_url, notice: "「#{@memo.name}」を登録しました。"
    else
      render :new
    end
  end   

  def edit
    @memo = current_user.memos.find(params[:id])
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
    params.require(:memo).permit(:name, :description, :tag, :image)
  end
end
