class SearchController < ApplicationController
  def search
    @model = params[:model]
    content = params[:content]
    how = params[:how]
  

    if @model == "user"
      @user = User.search(how,content)
    else
      @book = Book.search(how,content)
    end
  end
end
