class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    @new_book = Book.new
    @user = @book.user
    @comment = BookComment.new
    @comments = @book.book_comments
  end

  def destroy
    comment = BookComment.find(params[:id])
    comment.destroy
    @book = Book.find(params[:book_id])
    @new_book = Book.new
    @user = @book.user
    @comment = BookComment.new
    @comments = @book.book_comments
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
