class UsersController < ApplicationController

    def index # has VIEW

    end

    def new # has VIEW - to display a form to create a new artist

    end

    def create # only PROCESSING and redirect - form from 'new' will submit to this and save to the database

    end

    def show # has VIEW - show an individual artist

    end

    def edit # has VIEW - display a form for editing an artist

    end

    def update # only PROCESSING and redirect - form on update page will submit to update action and is used for updating artist in the database

    end

    def destroy # only PROCESSING and redirect - to delete an artist

    end
end

    # def create
    #     @user = User.new(params[:user])

    #     respond_to do |format|
    #         if user.save

    #     # respond_to do |format|
    #         if user.save
    #             UserMailer.welcome_email(@user).deliver
    #             format.html { redirect_to(@user, notice: 'User successfully created.') }
    #             format.json { render json: @user, status: :created, location: @user}
    #         else
    #             format.html { render action: 'new' }
    #             format.json { render json: @user.errors, status: :unprocessable_entity }
    #         end
    #     end
    # end
