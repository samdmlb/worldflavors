class BookmarksController < ApplicationController
  def my_bookmarks
    @bookmarks = Bookmark.where(user_id: current_user.id)
    render json: @bookmarks
  end

  def create
    puts params.inspect
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      render json: @bookmark, status: :created
    else
      render json: { errors: @bookmark.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    render json: { message: 'bookmark successfully removed' }
  end

  def destroy_from_cookbook
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to cookbook_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :recipe_id)
  end
end
