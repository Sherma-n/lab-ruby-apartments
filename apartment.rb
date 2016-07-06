# Apartment Test
def TestApartment (data)
  p "Apartment/////Apartment"
  p (data)
  p "Apartment/////Apartment"
end

# Require Files
require ("./Tenant")

#Creating a new Tenant
Sherman = Tenant.new 'Sherman', '28', 730
A = Tenant.new 'A', '28', 730
B = Tenant.new 'B', '28', 730
C = Tenant.new 'C', '28', 730

#Apartment Class
class Apartment

  #Making variables accessable to methods
  attr_accessor :number, :rent, :square_footage, :no_of_bedrooms, :no_of_bathrooms

  # #Inilialize on run
  def initialize number, rent, square_footage, no_of_bedrooms, no_of_bathrooms

    #Define Variables
    @apt_number  = number
    @apt_rent    = rent
    @apt_sqft    = square_footage
    @apt_bed     = no_of_bedrooms
    @apt_bath    = no_of_bathrooms
    @apt_tenants = []
  end

  def add_tenant(tenant)
    if tenant.credit_rating == "Bad"
      p "WARNING: Tenant #{tenant.name} has a BAD credit rating"
    elsif @apt_tenants.size > @apt_bed
      p "WARNING: Apartment is full"
    else
      @apt_tenants << tenant
      p "Tenant: #{tenant.name} is added to #{@apt_number}"
    end
  end

  def remove_tenant (tenant)
    removeName = tenant.name
    @apt_tenants.each do |i|
      if i.name == tenant.name
      p i
      end
    end
  end

end #Class Apartment Ends
# Tester
Apartment1 = Apartment.new "1", 500, 10000, 10, 15
Apartment1.add_tenant(Sherman)
Apartment1.add_tenant(A)
Apartment1.add_tenant(B)
Apartment1.add_tenant(C)
Apartment1.remove_tenant(Sherman)


