Rails.application.routes.draw do
# root to:'application#home'
# get  '/odds' => 'application#odds'

  namespace :staff do
    root 'top#index'
    get 'index' => 'top#index'
    get 'login' => 'top#login'
    post 'login' => 'top#login_result'
    get 'bet_prize' => 'top#bet_prize'
    post 'bet_prize_result' => 'top#bet_prize_result'
    get 'home' => 'top#home'
    get 'bet_question1' => 'top#bet_question1'
    get 'bet_question2' => 'top#bet_question2'
    get 'bet_question3' => 'top#bet_question3'
    get 'bet_question4' => 'top#bet_question4'
    get 'bet_question5' => 'top#bet_question5'
    post 'bet_question_result' => 'top#bet_question_result'
#    delete 'session' => 'sessions#destroy'
  end
  
  namespace :operator do
    get 'index' => 'top#index'
    get 'coin_status' => 'top#coin_status'
    get 'prize_status' => 'top#prize_status'
    get 'question1_status' => 'top#question1_status'
    get 'question2_status' => 'top#question2_status'
    get 'question3_status' => 'top#question3_status'
    get 'question4_status' => 'top#question4_status'
    get 'question5_status' => 'top#question5_status'
    post 'question1_result' => 'top#question1_result'
    post 'question2_result' => 'top#question2_result'
    post 'question3_result' => 'top#question3_result'
    post 'question4_result' => 'top#question4_result'
    post 'question5_result' => 'top#question5_result'
    get 'prize1_status' => 'top#prize1_status'
    get 'prize1_result' => 'top#prize1_result'
    get 'prize2_status' => 'top#prize2_status'
    get 'prize2_result' => 'top#prize2_result'
    get 'prize3_status' => 'top#prize3_status'
    get 'prize3_result' => 'top#prize3_result'
    get 'prize4_status' => 'top#prize4_status'
    get 'prize4_result' => 'top#prize4_result'
    get 'prize5_status' => 'top#prize5_status'
    get 'prize5_result' => 'top#prize5_result'
    get 'staff_member' => 'top#staff_member'
    get 'staff_member_option' => 'top#staff_member_option'
  end

  namespace :admin do
    root 'top#index'
#    get 'login' => 'sessions#new', as: :login
#    post 'session' => 'sessions#create', as: :login
#    delete 'session' => 'sessions#destroy'
  end
end
