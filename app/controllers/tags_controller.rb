class TagsController < ApplicationController

  def index
    @tags = current_user.tags
  end
  
  def new
    @tag = Tag.new
  end

  def create
    @tag = current_user.tags.new(tag_params)
    if @tag.save
        redirect_to tags_url, notice: "「#{@tag.name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    tag = current_user.tags.find(params[:id])
    tag.destroy
    redirect_to tags_url, notice: "「#{tag.name}」を削除しました。"
  end    

  private

  def tag_params
    params.require(:tag, :name)
  end
end
