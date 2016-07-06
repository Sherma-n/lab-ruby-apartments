# Apartment Test
def TestApartment (data)
  p "Apartment/////Apartment"
  p (data)
  p "Apartment/////Apartment"
end

# Require Files
require ("./Tenant")

#Apartment Class
class Apartment

  #Making variables accessable to methods
  attr_accessor :apt_number, :apt_rent, :apt_sqft, :apt_bed, :apt_bath, :apt_tenants, :apt_c_rating, :apt_avg_c

  # #Inilialize on run
  def initialize number, rent, square_footage, no_of_bedrooms, no_of_bathrooms

    #Define Variables
    @apt_number  = number
    @apt_rent    = rent
    @apt_sqft    = square_footage
    @apt_bed     = no_of_bedrooms
    @apt_bath    = no_of_bathrooms
    @apt_tenants = []
    @apt_avg_c   = 0
    @apt_c_rating= " "
  end # Initializa End

  # Adding tenant Method
  def add_tenant(tenant)

    # Tenant Validation
    if tenant.credit_rating == "Bad"
      p "WARNING: Tenant #{tenant.name} has a BAD credit rating"
    elsif @apt_tenants.size > @apt_bed
      p "WARNING: Apartment is full"
    else
      @apt_tenants << tenant
      p "Tenant: #{tenant.name} is added to #{@apt_number}"
    end

  end # Add Tenant End

  # Removing a Tenant
  def remove_tenant (tenant)

    # Checking if Tenant exsists & Removing a Tenant
    @apt_tenants.each do |i|
          p "#{tenant.name} has been removed from apartment #{@apt_number}"
          @apt_tenants.delete_if{|obj| obj.name == tenant.name}
            if @apt_tenants.include? 'i' == false
              p "No Such Tenant found"
            else
            end
    end

  end #Remove Tanent End

  #Removing all Tenants
  def remove_all_tenants
      @apt_tenants.clear
  end

  #calculating average credit rating
  def average_credit_score
    if @apt_tenants.size <= 0
      p "No Tenants!"
    else
      #Isolating credit Scores
      every_credit = Apartment1.apt_tenants.map { |i| i.credit_score  }

      #Summing total, then dividing by arr size
      average_credit = every_credit.reduce(:+) / every_credit.size

      #passing to class instance
      @apt_avg_c = average_credit
    end
  end #average_credit_score ends

  #apartment credit rating
  def apartment_credit_rating
    therating = rate_credit @apt_avg_c
    @apt_c_rating = therating
  end


end #Class Apartment Ends

# # Testing Objects
# Apartment1 = Apartment.new "1", 500, 10000, 10, 15
# #Creating new Tenants
# Sherman = Tenant.new 'Sherman', '28', 730
# A       = Tenant.new 'A', '28', 720
# B       = Tenant.new 'B', '28', 710
# C       = Tenant.new 'C', '28', 700
# Apartment1.add_tenant(Sherman)
# Apartment1.add_tenant(A)
# Apartment1.add_tenant(B)
# Apartment1.add_tenant(C)

# # Remove Tenant Test
# Apartment1.remove_tenant(Sherman)
# TestApartment(Apartment1.apt_tenants.map { |e| e.name  })

# # Remove All Tenant Test
# Apartment1.remove_all_tenants()
# TestApartment(Apartment1.apt_tenants.map { |e| e.name  })

# #Average credit test
# Apartment1.average_credit_score()
# TestApartment(Apartment1.apt_avg_c)
# #Rating
# Apartment1.apartment_credit_rating()
# p (Apartment1.apt_c_rating)
