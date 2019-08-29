class TagsController < ApplicationController
  before_action :set_tag, only: %i[edit update destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit; end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = 'Tag created'
      redirect_to tags_path
    else
      render :new
    end
  end

  def update
    @tag.update(tag_params)

    if @tag.save
      flash[:notice] = 'Tag updated'
      redirect_to tags_path
    else
      render :edit
    end
  end
  
  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
