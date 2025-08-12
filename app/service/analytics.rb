class analytics
    def self.most_searched(query, ip)
        full_search = MostSearched.where("LOWER(query) LIKE ?", "#{query.downcase}%").where(ip: ip).first

        if full_search.empty?
            short_search = MostSearched.where("LOWER(?) LIKE LOWER(query) || '%'", query).first

            if short_search.exists?
                if short_search.query == query 
                    short_search.increment!(:times_searched)
                else    
                    short_search.update(search: query, times_searched: 1)
                end
            end
        end
    end
end
