class BooksController < ApplicationController

    def top

    end

    def create
      @books = Book.all
      @book = Book.new(book_params)
      if @book.save
        redirect_to book_path(@book.id), notice: 'Book was successfully created.'
      else
        render action: 'index'
      end
    end

    def index
      @books = Book.all
      @book = Book.new
    end

    def show
      @books = Book.all
      @book = Book.find(params[:id])
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
      @books = Book.all
      @book = Book.find(params[:id])
      if @book.update(book_params)
         redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @books = Book.all
      @book = Book.find(params[:id])
      if @book.destroy
        redirect_to books_path, notice: 'Book was successfully destroyed.'
      else
        render action: 'book'
      end
    end

    private

    def book_params
        params.require(:book).permit(:title, :opinion)
    end

  end
