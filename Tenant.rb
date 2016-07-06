# Tenant Test
def TestTenant (data)
  p "Tenant/////Tenant"
  p (data)
  p "Tenant/////Tenant"
end

# Get Credit Rating Score
def rate_credit credit_score
  case credit_score
    when -1000 .. 559
      return "Bad"
    when 560 .. 659
      return "Mediocre"
    when 660 .. 724
      return "Good"
    when 725 .. 759
      return "Great"
    else
      return "Excellent"
  end
end

# Tenant Class
class Tenant

  # Make Variables accessable to methods
  attr_accessor :name, :age, :credit_score, :credit_rating

  # Define Variables @ Initialize
  def initialize name, age, credit_score
    @name          = name
    @age           = age
    @credit_score  = credit_score
    @credit_rating = rate_credit(credit_score)

  end# Init Ends Tenant
end # Tenent Class End

# # Testing
# Sherman = Tenant.new 'Sherman', '28', 730
# TestTenant(Sherman)