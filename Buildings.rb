# Requiring Apartments
require "./Apartment.rb"

#Buildings Test
def TestBuildings (data)
  p "Buildings ///// Buildings"
  p (data)
  p "Buildings ///// Buildings"
end

#Building Class
class Building

  #Making Attr accessable to methods
  attr_accessor :bld_add, :bld_apt, :bld_sqft, :bld_mnthly_rev, :bld_tenant

  #Init Buildings
  def initialize address="Address Unavailble"
    @bld_add        = address
    @bld_apt        = []
    @bld_sqft       = 0
    @bld_mnthly_rev = 0
    @bld_tenant     = []

    # Adding An apartment
    def add_apartment apartment

      #Apartment Validation
      if apartment.apt_number == " "
        p "#{apartment.apt_number} is not an apartment, please Check"

      #add apt
      else
        @bld_apt << apartment
        p "#{apartment.apt_number} added to #{@bld_add}"
      end

    end#Add Apartment end

    #Remove Apt
    def remove_apt apartment

      # find index for apt
      all_apt = @bld_apt.map { |i| i.apt_number }

      #validation
      if apartment.apt_number.to_s.include? all_apt.to_s
        p "apartment does not exsist"

      #Remove apt
      else
        @bld_apt.delete_if{ |obj| obj.apt_number == apartment.apt_number }
        p "#{apartment.apt_number} removed"
      end
    end

    #total sq ft
    def total_sqft
       #Get each sqft
       total = @bld_apt.map { |i| i.apt_sqft  }

       #sum them up
       total = total.reduce(:+)

       #pass to global
       @bld_sqft = total
    end

    def total_rent
       #Get each sqft
       total = @bld_apt.map { |i| i.apt_rent  }

       #sum them up
       total = total.reduce(:+)

       #pass to global
       @bld_mnthly_rev = total
    end

    #all tenants
    def bld_tenants
      all = self.bld_apt.map { |i| i.apt_tenants }
        all.each do |i|
          tent = i.map { |e| e.name  }
            @bld_tenant.push(tent[0])
            @bld_tenant.push(tent[1])
        end
    end

  #Credit Rating
  def apartments_by_average_credit_rating
    result = {excellent: [], great: [], good: [], mediocre: [], bad: []}
    @bld_apt.each_with_object(result) {|a,h| h[a.credit_rating] << a}
  end




















  end #Building Init End


end #Building Class End


# Testing Objects
Wall = Building.new "North Wall"


# Testing Adding an apartment
Wall.add_apartment(Apartment1)
Wall.add_apartment(Apartment2)
# TestBuildings(Wall.bld_apt.map {|e| e.apt_number})

# Deleting an apartment
Wall.remove_apt(Apartment3)

# total sqft
Wall.total_sqft()
p Wall.bld_sqft

# total rent
Wall.total_rent()
p Wall.bld_mnthly_rev

# bld tenants
Wall.bld_tenants()
p Wall.bld_tenant

