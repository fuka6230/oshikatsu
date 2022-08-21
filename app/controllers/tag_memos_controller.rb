class TagMemosController < ApplicationController

  def index
    @memo_tags = current_user.tag_memos
  end
  
  def new
    @memo_tag = TagMemo.new
  end

  def create
    @memo_tag = current_user.tag_memos.new(memo_tag_params)
    if @memo_tag.save
        redirect_to tag_memos_url, notice: "「#{@memo_tag.name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    memo_tag = current_user.tag_memos.find(params[:id])
    memo_tag.destroy
    redirect_to tag_memos_url, notice: "「#{memo_tag.name}」を削除しました。"
  end    

  private

  def memo_tag_params
    params.require(:tag_memo, :name)
  end
end
