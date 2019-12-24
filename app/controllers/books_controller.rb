class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  end
  def create
  	book = Book.new(book_params)
    if book.save(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book)
    else
      redirect_to books_path
      flash[:notice] = " Title can't be blank Body can't be blank"
    end
  end
  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book)
    else
      redirect_to edit_book_path(book)
      flash[:notice] = "Title can't be blank Body can't be blank"
    end
  end
  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
