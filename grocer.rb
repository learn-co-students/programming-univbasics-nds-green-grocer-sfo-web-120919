def find_item_by_name_in_collection(name, collection)
  collection.each do |item|
    if item[:item] == name
      return item
    end
  end
  return nil
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  should_i_skip = false

  final_cart = []
  cart.each do |product|
   final_cart.each do |final_product|
     should_i_skip = false
      if product[:item] == final_product[:item]
          final_product[:count] += 1
          should_i_skip = true
      end
    end
    next if should_i_skip
    product[:count] = 1
    final_cart << product
  end
  return final_cart
end


def apply_coupons(cart, coupons)
  cart.each do |cart_item|
    coupons.each do |coupon|
      if cart_item[:item] == coupon[:item]
        if cart_item[:count] % coupon[:num] == 0
          cart << {:item => cart_item[:item] + " W/COUPON", :price => coupon[:cost]/ coupon[:num], :clearance => cart_item[:clearance], :count => cart_item[:count] }
          cart_item[:count] = 0

        else
          cart << {:item => cart_item[:item] + " W/COUPON", :price => coupon[:cost]/ coupon[:num], :clearance => cart_item[:clearance], :count => cart_item[:count] - (cart_item[:count] % coupon[:num])}
          cart_item[:count] = cart_item[:count] % coupon[:num]
        end
      end
    end
  end
  return cart
end

def apply_clearance(cart)
  cart.each do |product|
    if product[:clearance] == true
        product[:price] = (product[:price]- (product[:price]* 0.20)).round(2)
    end
  end
  return cart
end

def checkout(cart, coupons)


con_cart = consolidate_cart(cart)
added_coupons = apply_coupons(con_cart, coupons)
discounted_cart = apply_clearance(added_coupons)

total = 0
i = 0

while i < discounted_cart.length
  total += discounted_cart[i][:price] * discounted_cart[i][:count]
  i += 1
end
if total > 100
    total -= (total * 0.10)
end
total

# Hash_cart = consolidate_cart(cart)
#  if cart.length == 1
#    total += cart[0][:price] * cart[0][:count]
#  else
#
# cart1 = consolidate_cart(cart)
# cart2 = apply_coupons(cart1, coupon)
# cart3 = apply_clearance(cart2)
#
#
# cart.each do |item|
#   item_total = item[:price] * item[:count]
#   total += item_total
# end
# end



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
