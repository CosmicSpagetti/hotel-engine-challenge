class Movie
    attr_accessor :adult, :backdrop_path, :genre_ids, :total_pages, :total_results, :id,:original_language
                  :original_title, :overview, :popularity, :poster_path, :release_date, :title, 
                  :video, :vote_average, :vote_count

    def initialize(params)
      @adult = params[:adult]
      @backdrop_path = params[:backdrop_path]
      @genre_ids = params[:genre_ids]
      @total_pages = params[:total_pages]
      @id = params[:id]
      @original_language = params[:original_language]
      @original_title = params[:original_title]
      @overview = params[:overview]
      @popularity = params[:popularity]
      @poster_path = params[:poster_path]
      @release_date = params[:release_date]
      @title = params[:title]
      @video = params[:video]
      @vote_average = params[:vote_average]
      @vote_count = params[:vote_count]
    end
end