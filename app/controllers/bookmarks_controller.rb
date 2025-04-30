class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [ :destroy ]
  before_action :set_bookmarks, only: [ :index ]

  def index
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmarks_path, notice: "登録完了しました"
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, notice: "削除しました"
  end
end

private

def set_bookmark
  @bookmark = Bookmark.find(params[:id])
end

def set_bookmarks
  @bookmarks = Bookmark.all
end

def bookmark_params
  params.require(:bookmark).permit(:title, :url)
end
