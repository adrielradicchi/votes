class SessionsController < ApplicationController
  before_action :set_sessions, only: [:login, :new]

  def new
    resp = Client.create_user(@user.name, @user.email, @user.password)
    if resp["token"] != nil 
      session["token_user"] = resp["token"] 
      render :js => "window.location.href='"+surveys_path+"'"
    end
  end

  def login 
    resp = Client.login(@user.email, @user.password)
    if resp["token"] != nil
      session["token_user"] = resp["token"] 
      render :js => "window.location.href='"+surveys_path+"'"
    end

  end

  def generate_token
    resp = Client.generate_token()
    if resp["token"] != nil
      session["session_id"] = resp["token"] 
    end
  end  
end
