class UserMailer < ActionMailer::Base

  default from: "from@domain.com" # sent from email

def welcome_email(user) # Welcome email plus user variable
    @user = user        # User variable from application
    @url = 'http://domain.com/login' # Desired target URL
    mail(to: @user.email, subject: 'Welcome to INSERT DESIRED BODY HERE')
end

def confirm_order(argument)
    @some_variable = some_variables
    attachments["cut, "]
end

end
