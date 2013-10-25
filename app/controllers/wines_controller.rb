class WinesController < ApplicationController

    def index

        request = Typhoeus.get("http://api.snooth.com/wines/",
            params: {akey: "uhtup8bko39e2mwdps1w0tr1vdea8oovrc1weykm8kzz2ug6", q: "cabernet sauvignon"})

        wines = JSON.parse(request.body)

    end

    def new # has VIEW - to display a form to create a new artist

    end

    def create # only PROCESSING and redirect - form from 'new' will submit to this and save to the database

    end

    def show # has VIEW - show an individual artist
        @wines = Wine.find(params[:q])
    end

    def edit # has VIEW - display a form for editing an artist

    end

    def update # only PROCESSING and redirect - form on update page will submit to update action and is used for updating artist in the database

    end

    def destroy # only PROCESSING and redirect - to delete an artist

    end
end