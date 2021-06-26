class SearchSerializer
    include FastJsonapi::ObjectSerializer
    attributes :query, :count, :id
end