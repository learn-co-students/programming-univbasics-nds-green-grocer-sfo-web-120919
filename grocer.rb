require 'pp'

def find_item_by_name_in_collection(name, collection)
 
  # Implement me first!
  #
  # Consult README for inputs and outputs
  collection.each do |item|
      if name == item[:item]
        return item
      end 
  end 
  
  return nil 
  
end

def item_count(cart, item_name)
    total = 0
    cart.each {|item| item[:item] == item_name ? (total += 1) : nil}
    return total 
end 

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  consolidated_cart = []
  cart.each do |item|
    
    if consolidated_cart.none? {|element| element[:item] == item[:item] } # item already consolidated   
    
     total_count = item_count(cart, item[:item]) 
     consolidated_cart << item.merge({count: total_count })  
     
    end
    
  end
  return consolidated_cart 
  
end

def retrieve_coupon(coupons, item)
  
  coupon = coupons.find {|coupon| coupon[:item] == item[:item] } # there is a coupon for the item in cart
  return coupon 
  
end

def get_applicable_coupon_count(coupon, item)
  
   return (coupon[:num] > item[:count]) ? item[:count] :  coupon[:num]
end 

def get_coupon_price(coupon, item)
  
   return (coupon[:cost] / get_applicable_coupon_count(coupon, item))
end 

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item| 
     
     my_coupon = retrieve_coupon(coupons, item)
    
     if my_coupon 
       coupon_price = get_coupon_price(my_coupon, item)
       coupon_count = get_applicable_coupon_count(my_coupon, item) 
       coupon_item = {item: "#{item[:item]} W/COUPON", price: coupon_price, clearance: item[:clearance], count: coupon_count }
       item[:count] -= coupon_item[:count]
       cart << coupon_item 
     end 
      
    
       
          
  end 
    
   
  return cart  
  
  
end

def discount_item(item, discount_percent)
  
  item[:price] = (item[:price ] - (item[:price] * (discount_percent / 100.0))).round(2)
  pp("After discount: ", item[:price])  
  return item 
  
end 

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
 
  discount_percent = 20
  cart.each do |item|
    
      if item[:clearance]
        discount_item(item, discount_percent)
      end 
    
  end 
 
  return cart 
  
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
  consolidated_cart = consolidate_cart(cart)
  apply_coupons(consolidated_cart, coupons)
  apply_clearance(consolidated_cart)
  total = 0
  consolidated_cart.each {|item| total += (item[:price] * item[:count]) }
  discount_threshold = 100
  discount_percent = 10.0
  if total > discount_threshold
    total = total - (total * (discount_percent / 100))
  end
  
  return total 
  
  
  
end



