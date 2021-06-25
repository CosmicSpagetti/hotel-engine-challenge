class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :page, :results, :total_pages, :total_results, :id
end
