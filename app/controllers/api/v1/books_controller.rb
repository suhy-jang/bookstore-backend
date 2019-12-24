class Api::V1::BooksController < ApiController
  before_action :set_book, only: [:destroy]

  def index
    @books = Book.all
    render json: @books
  end

  def create
    @book = Book.create(book_params)
    render json: @book
  end

  def destroy
    @book.destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :category)
  end
end
