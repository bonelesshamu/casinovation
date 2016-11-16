staff_names = %w{
aaa
bbb
ccc
ddd
eee
fff
ggg
hhh
iii
jjj
kkk
lll
mmm
nnn
ooo
ppp
qqq
rrr
sss
ttt
}

staff_names.length.times do |n|
  StaffMember.create( :name => staff_names[n],
                      :coin => 0,
                      :prize1_bet => rand(1..10)*10,
                      :prize2_bet => rand(1..10)*10,
                      :prize3_bet => rand(1..10)*10,
                      :prize4_bet => rand(1..10)*10,
                      :prize5_bet => rand(1..10)*10,
                      :prize_bet_flag => true
                      )
end

question_names = %w{
question1
question2
question3
question4
question5
}

option_names = %w{
1
2
3
4
5
}

(staff_names.length*5).times do |n|
  StaffMemberOption.create( :name => staff_names[n/5],
                            :question => question_names[n%question_names.length],
                            :option => option_names[(n/option_names.length)%option_names.length],
                            :bet => 10
                            )
end
