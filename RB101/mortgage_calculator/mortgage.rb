require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

def validate_loan_amount(loan_amount)
  stripped_loan_amount = loan_amount.delete("$").delete(",")
  Float(stripped_loan_amount) rescue false
end

def validate_interest(annual_interest)
  annual_interest.delete!("%")
  annual_interest.gsub(",", ".")
  Float(annual_interest) rescue false
end

def monthly_interest(apr)
  apr/100/12
end

def duration_in_months(duration)
  duration * 12
end

loan_amount = ''
puts MESSAGES['ask_loan_amount']
loop do
  loan_amount = validate_loan_amount(gets.chomp)

  if loan_amount
    break
  else
    puts MESSAGES['invalid_amount']
  end
end

annual_interest = ''
puts MESSAGES['ask_interest']
loop do
  annual_interest = validate_interest(gets.chomp)

  if annual_interest
    break
  else
    puts MESSAGES['invalid_interest']
  end
end

loan_duration = ''
puts MESSAGES['ask_duration']

loop do
  loan_duration = Integer(gets.chomp) rescue false
  if loan_duration
    break
  else
    puts MESSAGES['invalid_duration']
  end
end

monthly_payment = loan_amount * (monthly_interest(annual_interest) / (1 - (1 + monthly_interest(annual_interest))**(-duration_in_months(loan_duration))))

puts <<-MSG
      #{MESSAGES['monthly_payment']} $#{monthly_payment.round(2)}
      #{MESSAGES['monthly_interest']} #{(monthly_interest(annual_interest) * 100).round(2)}%
      #{MESSAGES['duration']} #{duration_in_months(loan_duration)}
     MSG
