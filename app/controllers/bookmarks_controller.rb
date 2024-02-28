class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create destroy]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @movies = @list.movies
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
