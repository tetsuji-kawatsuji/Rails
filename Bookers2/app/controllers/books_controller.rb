class BooksController < ApplicationController

    def top
    end

    def about
    end

    def create
      @user = current_user
      @books = Book.all
      @book = Book.new(book_params)
      if @book.save
        redirect_to book_path(@book.id), notice: 'Book was successfully created.'
      else
        render action: 'index'
      end
    end

    def index
      @user = current_user
      @books = Book.all
      @book = Book.new
    end

    def show
      @user = current_user
      @books = Book.all
      @book = Book.find(params[:id])
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
      @user = current_user
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
