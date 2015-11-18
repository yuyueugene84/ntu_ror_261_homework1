# homework1
# 剪刀石頭布
# 先要使用者輸入剪刀石頭或布的其中一個選項
# 接下來讓電腦亂數選出一個選項
# 比較兩個選項，決定誰贏誰輸
# 輸出結果
# 問使用者是否再玩一次

# 記住 method 是獨立出主程式的，要定義在主程式外面，而且是呼叫它的程式碼上方
def get_computer_input
  return ["R","P","S"].shuffle!.last
end

def check_win(user_input, computer_input)

  if (user_input == computer_input)
    return "It's a draw"
  elsif user_input == "R"
    if computer_input == "S"
      return "You Win"
    elsif computer_input == "P"
      return "You Lose"
    end
  elsif user_input == "P"
    if computer_input == "R"
      return "You Win"
    elsif computer_input == "S"
      return "You Lose"
    end
  elsif user_input == "S"
    if computer_input == "P"
      return "You Win"
    elsif computer_input == "R"
      return "You Lose"
    end
  end

end
# 把 "R","P","S" 轉回可讀的字串
def get_input_string(input)
  gestures = {
    "R" => "Rock",
    "P" => "Paper",
    "S" => "Scissors"
  }

  return gestures[input]
end

def print_result(user_input, computer_input, message)
  # 記住請多善用字串內差
  puts "You choose #{get_input_string(user_input)}, computer chooses #{get_input_string(computer_input)}, #{message}!"
  puts "================================================="
end

def intro
  puts "|===============================================|" 
  puts "|Welcome to Rock Paper Scissors!!!              |"
  puts "|===============================================|"
end

def get_user_input
  begin 
    puts "please choose one of the following: R / P / S"
    user_input = gets.chomp.upcase
  end while !["R", "P", "S"].include?(user_input) 

  return user_input
end

def continue?
  begin
    puts "Play Again?: Y / N"
    continue = gets.chomp.upcase
  end while !["Y", "N"].include?(continue)

  return continue
end

#---------------- Main Program Starts Here ---------------

#印出歡迎訊息
intro()
#這是對應到97行的 end whlie，讓使用者能繼續玩
begin 
  #取額使用者
  user_input = get_user_input()
  # 取得電腦的輸入
  computer_input = get_computer_input()
  # 檢查誰贏誰輸
  message = check_win(user_input, computer_input)
  # 印出結果
  print_result(user_input, computer_input, message)
  #問使用者是否還要再玩 
  continue = continue?

end while continue == "Y"
# 若使用者回答 "N"，印出離開的訊息，不是就回到迴圈的上層繼續玩
puts "|===============================================|"
puts "|       Good Bye! Thanks for playing!           |"
puts "|           Rock Paper Scissors!!!              |"
puts "|           by Eugene Chang 2015                |"
puts "|===============================================|"