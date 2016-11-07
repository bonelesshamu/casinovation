class Operator::TopController < ApplicationController
  protect_from_forgery :except => [:question1_result, :question2_result, :question3_result, :question4_result, :question5_result]

  def index
    render action: 'index'
  end

  def coin_status
    @staffmemberdatas = StaffMember.all
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
    render action: 'question1_result'
  end

  def question2_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question2")
    render action: 'question2_result'
  end

  def question3_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question3")
    render action: 'question3_result'
  end

  def question4_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question4")
    render action: 'question4_result'
  end

  def question5_result
    @answer = params[:answer]
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    question_result( @answer, "question5")
    render action: 'question5_result'
  end

  def question_result answer, question
    @staffmemberdatas = StaffMember.all
    @staffmemberoptiondatas = StaffMemberOption.all
    @staffmemberdatas.each do |data|
      correctUser = @staffmemberoptiondatas.find_by(name: data.name, question: question)
      if correctUser.option == answer
        data.coin = data.coin + correctUser.bet
        data.save
      else
        data.coin = data.coin - correctUser.bet
        data.save
      end
    end
  end

  def prize1_status
    @staffmemberdatas = StaffMember.all
    render action: 'prize1_status'
  end

  def prize2_status
    @staffmemberdatas = StaffMember.all
    render action: 'prize2_status'
  end

  def prize3_status
    @staffmemberdatas = StaffMember.all
    render action: 'prize3_status'
  end

  def prize4_status
    @staffmemberdatas = StaffMember.all
    render action: 'prize4_status'
  end

  def prize5_status
    @staffmemberdatas = StaffMember.all
    render action: 'prize5_status'
  end

  def prize1_result
    @winner = prize_result( StaffMember.where("prize='prize1'") )
    render action: 'prize1_result'
  end

  def prize2_result
    @winner = prize_result( StaffMember.where("prize='prize2'") )
    render action: 'prize2_result'
  end

  def prize3_result
    @winner = prize_result( StaffMember.where("prize='prize3'") )
    render action: 'prize3_result'
  end

  def prize4_result
    @winner = prize_result( StaffMember.where("prize='prize4'") )
    render action: 'prize4_result'
  end

  def prize5_result
    @winner = prize_result( StaffMember.where("prize='prize5'") )
    render action: 'prize5_result'
  end

  def prize_result staffmemberdatas
    win = rand(0...100)
    tmp = 0.0
    coin_sum = staffmemberdatas.sum(:coin)
    @winner = ""

    staffmemberdatas.each do |data|
      tmp += data.coin.to_f / coin_sum.to_f * 100.0
      if win < tmp
        @winner = data.name
        data.acquirer = true
        data.save
        break
      end
    end
    return @winner
  end

end
