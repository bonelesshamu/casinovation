class Staff::TopController < ApplicationController
  protect_from_forgery :except => [:login_result, :bet_prize_result, :bet_question_result]
  
  def index
    render action: 'login'
  end

  def login
    p StaffMember.all
    render action: 'login'
  end

  def login_result
    @name = params["name"]
    newStaffMember = StaffMember.new
    newStaffMember.name = @name
    newStaffMember.coin = 10000
    newStaffMember.prize = "prize1"
    newStaffMember.save    
    #p StaffMember.all
    @staffmemberdatas = StaffMember.all
    @user_id = newStaffMember.id
    session[:user_id] = @user_id
    render action: 'login_post'
  end

  def bet_prize
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    render action: "bet_prize"
  end

  def bet_prize_result
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @prize = params["prize"]
    currentStaffMember.prize = @prize
    currentStaffMember.save
    render action: "bet_prize_result"
  end

  def home
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    p currentStaffMember
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    @prize = currentStaffMember.prize
    @staffmemberdatas = StaffMember.all
    render action: "home"
  end

  def bet_question1
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    render action: "bet_question1"
  end

  def bet_question2
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    render action: "bet_question2"
  end

  def bet_question3
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    render action: "bet_question3"
  end

  def bet_question4
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    render action: "bet_question4"
  end

  def bet_question5
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    render action: "bet_question5"
  end

  def bet_question_result
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @question_id = params["question_id"]
    @option = params["option"]
    @bet = params["bet"]
    if StaffMemberOption.find_by(name: @name, question: @question_id).nil?
      currentStaffMemberOption = StaffMemberOption.new
      currentStaffMemberOption.name = @name
      currentStaffMemberOption.question = @question_id
      currentStaffMemberOption.option = @option
      currentStaffMemberOption.bet = @bet.to_i
      currentStaffMemberOption.save
      p currentStaffMemberOption
    else
      puts "already betted"
    end
    render action: "bet_question_result"
  end

  def staffmember
    render json: StaffMember.all
  end

  def staffmemberoption
    render json: StaffMemberOption.all
  end
end
