class BooksController < ApplicationController
  def new
      @book =Book.new
  end

  def index
      @books = Book.all
      @book = Book.new
  end

  def create
      book = Book.new(post_params)
      book.save
      redirect_to book_path(book), notice: "Book was successfully created."
  end

  def show
      @book = Book.find(params[:id])
  end
  
  def edit
      @book = Book.find(params[:id])
  end
  
  def update
      book = Book.find(params[:id])
      book.update(post_params)
      redirect_to show, notice: "Book was successfully updated."
  end
  
  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path, notice: "Book was successfully destroyed."
  end
  
  private
  
  def post_params
      params.require(:book).permit(:title, :body)
  end
end
