module EventsHelper
    require 'typhoeus'
    require 'json'

    def search(query)

        # eb_auth_tokens = { app_key: 'YRJ7IOQUMTP2OS2TLXS',
        #                    user_key: 'YRJ7IOQUMTP2OS2TLXS'}
        # eb_client = EventbriteClient.new(eb_auth_tokens)

        query = params[:m]

        request = Typhoeus.get(
        "https://www.eventbrite.com/json/event_search?app_key=YRJ7IOQUMTP2OS2TLXS&keywords=wine&keywords=winery",
        params: {s: query}
        )

        results = JSON.parse(request.body)["Search"]

        if !results && !params[:m]
            @message = "no search"
        elsif !results
            @message = "bad search"
        else
            results.each do |movie|
                rating = Movie.find_by_imdbid movie["imdbID"]
                if rating
                    movie["rating"] = "#{rating.rating}"
                else
                    movie["rating"] = "(none)"
                end
            end

            @results = results.sort { |x, y| y["rating"] <=> x["rating"] }
        end
    end
end
