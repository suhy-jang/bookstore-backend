class Api::V1::BooksController < ApiController
  before_action :set_book, only: [:destroy]

  def index
    @books = Book.all
    render json: { books: @books }
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: {
        status: :created,
        location: @book
      }
    else
      render json: {
        status: :fail,
        errors: @book.errors.full_messages
      }
    end
  end

  def destroy
    if @book.destroy
      render json: {
        status: :destroyed
      }
    else
      render json: {
        status: :fail,
        errors: ['failed delete']
      }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :category)
  end
end
