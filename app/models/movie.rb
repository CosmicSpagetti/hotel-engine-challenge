class Movie
    attr_accessor :date, :page, :results, :total_pages, :total_results, :id
    def initialize(params)
        @id = 1
        @date = params[:date]
        @page = params[:page]
        @results = params[:results]
        @total_pages = params[:total_pages]
        @total_results = params[:total_results]
    end
end