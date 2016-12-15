class CategoriesController < ApplicationController
  include TheSortableTreeController::Rebuild
  include TheSortableTreeController::ExpandNode

  def index
    @categories = Category.nested_set.roots.select('id, title, content, parent_id')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render :action => :index
  end

  def show
    @category = Category.find(params[:id])
    render :action => :edit
  end

  def manage
    # @categories = Category.nested_set.select('id, title, content, parent_id').all
    @categories = Category.nested_set.roots.select('id, title, content, parent_id')
  end

  def node_manage
    @root = Category.root
    @categories = @root.self_and_descendants.nested_set.select('id, title, content, parent_id')
    render template: 'categories/manage'
  end

  private
  def category_params
    params.require(:category).permit(:id, :title, :parent_id)
  end
end
