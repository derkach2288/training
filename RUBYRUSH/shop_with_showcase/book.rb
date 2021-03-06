class Book < Product
    attr_accessor :title, :genre, :author

    def initialize(params)
        super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
    end

    def to_s
        "Книга \"#{@title}\", жанр #{@genre}, автор #{@author}, #{super}"
    end
end
