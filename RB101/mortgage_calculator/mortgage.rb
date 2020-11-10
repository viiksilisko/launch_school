require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

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

def monthly_interest(apr)
  apr / 100 / 12
end

def prompt(message)
  puts MESSAGES[message]
end

puts MESSAGES['welcome']

loan_amount = ''
puts MESSAGES['ask_loan_amount']
loop do
  loan_amount = validate_loan_amount(gets.chomp)
  loan_amount ? break : prompt('invalid_amount')
end

annual_interest = ''
puts MESSAGES['ask_interest']
loop do
  annual_interest = validate_interest(gets.chomp)
  annual_interest ? break : prompt('invalid_interest')
end

loan_duration = ''
puts MESSAGES['ask_duration']
loop do
  loan_duration = validate_loan_duration(gets.chomp)
  loan_duration ? break : prompt('invalid_duration')
end

monthly_payment =
  loan_amount * (monthly_interest(annual_interest) / (1 - (1 + monthly_interest(annual_interest))**(-loan_duration * 12)))

puts <<-MSG
      #{MESSAGES['monthly_payment']} $#{monthly_payment.round(2)}
      #{MESSAGES['monthly_interest']} #{(monthly_interest(annual_interest) * 100).round(2)}%
      #{MESSAGES['duration']} #{loan_duration * 12} months.
     MSG
