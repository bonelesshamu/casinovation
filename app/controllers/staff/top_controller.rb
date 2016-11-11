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
    newStaffMember.save    
    #p StaffMember.all
    @staffmemberdatas = StaffMember.all
    @user_id = newStaffMember.id
    session[:user_id] = @user_id
    render action: 'login_post'
  end

  def home
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    @already_bet = false
    @prize1_bet = 0
    @prize2_bet = 0
    @prize3_bet = 0
    @prize4_bet = 0
    @prize5_bet = 0
    p currentStaffMember
    if currentStaffMember.prize_bet_flag
      @already_bet = true
      @prize1_bet = currentStaffMember.prize1_bet
      @prize2_bet = currentStaffMember.prize2_bet
      @prize3_bet = currentStaffMember.prize3_bet
      @prize4_bet = currentStaffMember.prize4_bet
      @prize5_bet = currentStaffMember.prize5_bet
    end
    @staffmemberdatas = StaffMember.all
    render action: "home"
  end

  def bet_prize
    @user_id = session[:user_id]
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    render action: "bet_prize"
  end

  def bet_prize_result
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @already_bet = false

    if currentStaffMember 
      if currentStaffMember.prize_bet_flag
        @already_bet = true
        @prize1_bet = currentStaffMember.prize1_bet
        @prize2_bet = currentStaffMember.prize2_bet
        @prize3_bet = currentStaffMember.prize3_bet
        @prize4_bet = currentStaffMember.prize4_bet
        @prize5_bet = currentStaffMember.prize5_bet
      else
        @prize1_bet = params["prize1"]
        currentStaffMember.prize1_bet = @prize1_bet.to_i
        @prize2_bet = params["prize2"]
        currentStaffMember.prize2_bet = @prize2_bet.to_i
        @prize3_bet = params["prize3"]
        currentStaffMember.prize3_bet = @prize3_bet.to_i
        @prize4_bet = params["prize4"]
        currentStaffMember.prize4_bet = @prize4_bet.to_i
        @prize5_bet = params["prize5"]
        currentStaffMember.prize5_bet = @prize5_bet.to_i
        currentStaffMember.prize_bet_flag = true
        currentStaffMember.coin = 0
        currentStaffMember.save
      end
    else
      @prize1_bet = "Error"
      @prize2_bet = "Error"
      @prize3_bet = "Error"
      @prize4_bet = "Error"
      @prize5_bet = "Error"
    end
    render action: "bet_prize_result"
  end

  def bet_question1
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    render action: "bet_question1"
  end

  def bet_question2
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    render action: "bet_question2"
  end

  def bet_question3
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    render action: "bet_question3"
  end

  def bet_question4
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    render action: "bet_question4"
  end

  def bet_question5
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    render action: "bet_question5"
  end

  def bet_question_result
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
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
