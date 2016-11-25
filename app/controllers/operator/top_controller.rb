class Operator::TopController < ApplicationController
  protect_from_forgery :except => [:question1_result, :question2_result, :question3_result, :question4_result, :question5_result]

  def index
    p QuestionResult.all
    render action: 'index'
  end

  def coin_status
    @staffmemberdatas = StaffMember.order("coin DESC")
    render action: 'coin_status'
  end

  def prize_status
    @staffmemberdatas = StaffMember.all
    render action: 'prize_status'    
  end

  def question1_status
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    render action: 'question1_status'
  end

  def question2_status
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    render action: 'question2_status'
  end

  def question3_status
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    render action: 'question3_status'
  end

  def question4_status
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    render action: 'question4_status'
  end

  def question5_status
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    render action: 'question5_status'
  end

  def question1_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question1")
    currentQuestionResult = QuestionResult.find_by(id: 1)
    currentQuestionResult.answer1 = @answer.to_i
    currentQuestionResult.save
    p QuestionResult.find_by(id: 1)
    render action: 'question1_result'
  end

  def question2_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question2")
    currentQuestionResult = QuestionResult.find_by(id: 1)
    currentQuestionResult.answer2 = @answer.to_i
    currentQuestionResult.save
    p QuestionResult.find_by(id: 1)
    render action: 'question2_result'
  end

  def question3_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question3")
    currentQuestionResult = QuestionResult.find_by(id: 1)
    currentQuestionResult.answer3 = @answer.to_i
    currentQuestionResult.save
    p QuestionResult.find_by(id: 1)
    render action: 'question3_result'
  end

  def question4_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question4")
    currentQuestionResult = QuestionResult.find_by(id: 1)
    currentQuestionResult.answer4 = @answer.to_i
    currentQuestionResult.save
    p QuestionResult.find_by(id: 1)
    render action: 'question4_result'
  end

  def question5_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question5")
    currentQuestionResult = QuestionResult.find_by(id: 1)
    currentQuestionResult.answer5 = @answer.to_i
    currentQuestionResult.save
    p QuestionResult.find_by(id: 1)
    render action: 'question5_result'
  end

  def question_result answer, question
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    @staffmemberdatas.each do |data|
      correctUser = @staffmemberoptiondatas.find_by(name: data.name, question: question)
      if correctUser && correctUser.bet
        if correctUser.option && correctUser.option == answer
          data.coin += 5 * correctUser.bet + 5
          data.save
        else
          data.coin += 5
          data.save
        end
      end
    end
  end

  def prize1_status
    @staffmemberdatas = StaffMember.order("prize1_bet DESC")
    render action: 'prize1_status'
  end

  def prize2_status
    @staffmemberdatas = StaffMember.order("prize2_bet DESC")
    render action: 'prize2_status'
  end

  def prize3_status
    @staffmemberdatas = StaffMember.order("prize3_bet DESC")
    render action: 'prize3_status'
  end

  def prize4_status
    @staffmemberdatas = StaffMember.order("prize4_bet DESC")
    render action: 'prize4_status'
  end

  def prize5_status
    @staffmemberdatas = StaffMember.order("prize5_bet DESC")
    render action: 'prize5_status'
  end

  def prize1_result
    @winner = prize_result( :prize1_bet, :prize1_winner )
    render action: 'prize1_result'
  end

  def prize2_result
    @winner = prize_result( :prize2_bet, :prize2_winner )
    render action: 'prize2_result'
  end

  def prize3_result
    @winner = prize_result( :prize3_bet, :prize3_winner )
    render action: 'prize3_result'
  end

  def prize4_result
    @winner = prize_result( :prize4_bet, :prize4_winner )
    render action: 'prize4_result'
  end

  def prize5_result
    @winner = prize_result( :prize5_bet, :prize5_winner )
    render action: 'prize5_result'
  end

  def prize_result prize_bet, prize_winner
    win = rand(0...100)
    tmp = 0.0
    bet_sum = StaffMember.sum(prize_bet)
    @winner = ""
    if bet_sum == 0
      return
    end

    StaffMember.all.each do |data|
      tmp += data[prize_bet] / bet_sum.to_f * 100.0
      if win < tmp
        @winner = data.name
        data.attributes = { prize_winner => true }
        data.save
        break
      end
    end
    return @winner
  end

  def staff_member
    @staffmember = StaffMember.all
  end

  def staff_member_option
    @staffmemberoption = StaffMemberOption.all
  end

  def flag_init
    currentQuestionResult = QuestionResult.find_by(id: 1)
    currentQuestionResult.answer1 = 0
    currentQuestionResult.answer2 = 0
    currentQuestionResult.answer3 = 0
    currentQuestionResult.answer4 = 0
    currentQuestionResult.answer5 = 0
    currentQuestionResult.save
  end
end
