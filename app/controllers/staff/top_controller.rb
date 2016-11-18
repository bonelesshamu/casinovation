# -*- coding: utf-8 -*-
class Staff::TopController < ApplicationController
  protect_from_forgery :except => [:login_result, :bet_prize_result, :bet_question_result1, :bet_question_result2, :bet_question_result3, :bet_question_result4, :bet_question_result5]
  
  def index
    render action: 'login'
  end

  def login
    @user_id = session[:user_id]
    p @user_id
    currentStaffMember = StaffMember.find_by(id: @user_id)
    if @user_id && currentStaffMember
      home
    else
      render action: 'login'
    end
  end

  def login_result
    @name = params["name"]
    newStaffMember = StaffMember.new
    newStaffMember.name = @name
    newStaffMember.coin = 50
    newStaffMember.save    
    #p StaffMember.all
    @staffmemberdatas = StaffMember.all
    @user_id = newStaffMember.id
    session[:user_id] = @user_id
    #render action: 'login_post'
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
    puts @coin
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: "question1")
    if currentStaffMemberOption.nil?
      render action: "bet_question1"
    else
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
      @answer1 = QuestionResult.find(1).answer1
      @is_correct = @answer1 == @option.to_i
      render action: "bet_question_result1"
    end
  end

  def bet_question2
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: "question2")
    if currentStaffMemberOption.nil?
      render action: "bet_question2"
    else
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
      @answer2 = QuestionResult.find(1).answer2
      @is_correct = @answer1 == @option.to_i
      render action: "bet_question_result2"
    end
  end

  def bet_question3
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: "question3")
    if currentStaffMemberOption.nil?
      render action: "bet_question3"
    else
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
      @answer3 = QuestionResult.find(1).answer3
      @is_correct = @answer1 == @option.to_i
      render action: "bet_question_result3"
    end
  end

  def bet_question4
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: "question4")
    if currentStaffMemberOption.nil?
      render action: "bet_question4"
    else
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
      @answer4 = QuestionResult.find(1).answer4
      @is_correct = @answer1 == @option.to_i
      render action: "bet_question_result4"
    end
  end

  def bet_question5
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: "question5")
    if currentStaffMemberOption.nil?
      render action: "bet_question5"
    else
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
      @answer5 = QuestionResult.find(1).answer5
      @is_correct = @answer1 == @option.to_i
      render action: "bet_question_result5"
    end
  end

  def bet_question_result1
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    @question_id = "question1"
    @option = params["option"]
    @bet = params["bet"]
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: @question_id)
    if currentStaffMemberOption.nil?
      currentStaffMember.coin -= @bet.to_i
      currentStaffMember.save
      @coin = currentStaffMember.coin
      currentStaffMemberOption = StaffMemberOption.new
      currentStaffMemberOption.name = @name
      currentStaffMemberOption.question = @question_id
      currentStaffMemberOption.option = @option
      currentStaffMemberOption.bet = @bet.to_i
      currentStaffMemberOption.save
      p currentStaffMemberOption
    else
      puts "already betted"
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
    end
    @answer1 = QuestionResult.find(1).answer1
    @is_correct = @answer1 == @option.to_i
    render action: "bet_question_result1"
  end

  def bet_question_result2
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    @question_id = "question2"
    @option = params["option"]
    @bet = params["bet"]
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: @question_id)
    if currentStaffMemberOption.nil?
      currentStaffMember.coin -= @bet.to_i
      currentStaffMember.save
      @coin = currentStaffMember.coin
      currentStaffMemberOption = StaffMemberOption.new
      currentStaffMemberOption.name = @name
      currentStaffMemberOption.question = @question_id
      currentStaffMemberOption.option = @option
      currentStaffMemberOption.bet = @bet.to_i
      currentStaffMemberOption.save
      p currentStaffMemberOption
    else
      puts "already betted"
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
    end
    @answer2 = QuestionResult.find(1).answer2
    @is_correct = @answer2 == @option.to_i
    p @is_correct
    render action: "bet_question_result2"
  end

  def bet_question_result3
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    @question_id = "question3"
    @option = params["option"]
    @bet = params["bet"]
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: @question_id)
    if currentStaffMemberOption.nil?
      currentStaffMember.coin -= @bet.to_i
      currentStaffMember.save
      @coin = currentStaffMember.coin
      currentStaffMemberOption = StaffMemberOption.new
      currentStaffMemberOption.name = @name
      currentStaffMemberOption.question = @question_id
      currentStaffMemberOption.option = @option
      currentStaffMemberOption.bet = @bet.to_i
      currentStaffMemberOption.save
      p currentStaffMemberOption
    else
      puts "already betted"
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
    end
    @answer3 = QuestionResult.find(1).answer3
    @is_correct = @answer3 == @bet
    p @is_correct
    render action: "bet_question_result3"
  end

  def bet_question_result4
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    @question_id = "question4"
    @option = params["option"]
    @bet = params["bet"]
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: @question_id)
    if currentStaffMemberOption.nil?
      currentStaffMember.coin -= @bet.to_i
      currentStaffMember.save
      @coin = currentStaffMember.coin
      currentStaffMemberOption = StaffMemberOption.new
      currentStaffMemberOption.name = @name
      currentStaffMemberOption.question = @question_id
      currentStaffMemberOption.option = @option
      currentStaffMemberOption.bet = @bet.to_i
      currentStaffMemberOption.save
      p currentStaffMemberOption
    else
      puts "already betted"
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
    end
    @answer4 = QuestionResult.find(1).answer4
    @is_correct = @answer4 == @option.to_i
    p @is_correct
    render action: "bet_question_result4"
  end

  def bet_question_result5
    @user_id = session[:user_id]
    puts "user_id: " + @user_id.to_s
    currentStaffMember = StaffMember.find_by(id: @user_id)
    @name = currentStaffMember.name
    @coin = currentStaffMember.coin
    @question_id = "question5"
    @option = params["option"]
    @bet = params["bet"]
    currentStaffMemberOption = StaffMemberOption.find_by(name: @name, question: @question_id)
    if currentStaffMemberOption.nil?
      currentStaffMember.coin -= @bet.to_i
      currentStaffMember.save
      @coin = currentStaffMember.coin
      currentStaffMemberOption = StaffMemberOption.new
      currentStaffMemberOption.name = @name
      currentStaffMemberOption.question = @question_id
      currentStaffMemberOption.option = @option
      currentStaffMemberOption.bet = @bet.to_i
      currentStaffMemberOption.save
      p currentStaffMemberOption
    else
      puts "already betted"
      @option = currentStaffMemberOption.option
      @bet = currentStaffMemberOption.bet
    end
    @answer5 = QuestionResult.find(1).answer5
    @is_correct = @answer5 == @option.to_i
    p @is_correct
    render action: "bet_question_result5"
  end

  def staffmember
    render json: StaffMember.all
  end

  def staffmemberoption
    render json: StaffMemberOption.all
  end
end
