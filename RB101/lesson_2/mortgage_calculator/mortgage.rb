require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

def clear_screen
  system('clear') || system('cls')
end

def validate_loan_amount(loan_amount)
  valid_amount = loan_amount.delete("$").delete(",").to_f
  valid_amount > 0 ? valid_amount : false
end

def validate_interest(annual_interest)
  valid_interest = annual_interest.delete("%").gsub(",", ".").to_f
  valid_interest > 0 ? valid_interest : false
end

def validate_loan_duration(duration)
  duration.to_i > 0 ? duration.to_i : false
end

def prompt(message)
  puts MESSAGES[message]
end

def get_loan_amount
  prompt('ask_loan_amount')
  loan_amount = ''
  loop do
    loan_amount = validate_loan_amount(gets.chomp)
    loan_amount ? break : prompt('invalid_amount')
  end
  loan_amount
end

def get_interest_amount
  annual_interest = ''
  prompt('ask_interest')
  loop do
    annual_interest = validate_interest(gets.chomp)
    annual_interest ? break : prompt('invalid_interest')
  end
  annual_interest / 100 / 12
end

def get_loan_duration
  loan_duration = ''
  prompt('ask_duration')
  loop do
    loan_duration = validate_loan_duration(gets.chomp)
    loan_duration ? break : prompt('invalid_duration')
  end
  loan_duration * 12
end

def display_results(monthly_payment, monthly_interest, loan_duration)
  puts <<-MSG
    #{MESSAGES['monthly_payment']} $#{monthly_payment.round(2)}
    #{MESSAGES['monthly_interest']} #{(monthly_interest * 100).round(2)}%
    #{MESSAGES['duration']} #{loan_duration} months.
  MSG
end

def calculate_monthly_payment(loan_amount, loan_duration, monthly_interest)
  loan_amount * (monthly_interest / 
                (1 - (1 + monthly_interest)**(-loan_duration)))
end

loop do
  clear_screen
  prompt('welcome')

  loan_amount = get_loan_amount

  monthly_interest = get_interest_amount

  months = get_loan_duration

  puts loan_amount
  monthly_payment = calculate_monthly_payment(loan_amount, 
                                              months, 
                                              monthly_interest)

  display_results(monthly_payment, monthly_interest, months)

  prompt('another_calculation')

  response = gets.chomp
  break unless response.downcase == 'y'
end
