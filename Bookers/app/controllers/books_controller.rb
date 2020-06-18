class BooksController < ApplicationController

  def top

  end

  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      render action: 'index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    before_uri = URI.parse(request.referer)
    @path = Rails.application.routes.recognize_path(before_uri.path)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      render action: 'edit'
    end
  end

  def destroy
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'Book was successfully destroyed.'
      redirect_to books_path
    else
      render action: 'index'
    end
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end

end
