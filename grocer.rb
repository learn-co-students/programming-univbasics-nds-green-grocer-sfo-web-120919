def find_item_by_name_in_collection(name, collection)
  collection.each do |ele|
    if  ele[:item] == name
      return ele
    end
  end
  return nil
end

def consolidate_cart(cart)
  new_arr = []
  cart.each do |ele|
    if new_arr.include?(ele)
      ele[:count] += 1
    else
      ele[:count] = 1
  end
    new_arr << ele
  end
  new_arr
end

def apply_coupons(cart, coupons)
 new_arr = []
 

def apply_clearance(cart)
 new_arr = []
  cart.each do |ele|
    ele.each do |key,val|
      pp ele
      if !new_arr.include?(key)
        new_arr << {key => val}
      end
    end
    
  end
  pp new_arr
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
