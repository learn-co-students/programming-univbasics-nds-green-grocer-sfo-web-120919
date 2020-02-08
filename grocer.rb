require 'pry'
def find_item_by_name_in_collection(name, collection)
  index = 0
  while index < collection.length
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end
  return nil
end


def consolidate_cart(cart)
  new_cart = []
  counter = 0
  while counter < cart.length
    new_cart_item  = find_item_by_name_in_collection(cart[counter][:item], new_cart)
    if new_cart_item != nil
      new_cart_item[:count] += 1
    else
      new_cart_item = {
      :item => cart[counter][:item],
      :price => cart[counter][:price],
      :clearance => cart[counter][:clearance],
      :count => 1
    }
    new_cart << new_cart_item
    end
    #check if the item is in the new cart, if not add to cart
    #{:item => "AVOCADO", :price => 3.00, :clearance => true}
    counter += 1
  end
  # Consult README for inputs and outputs
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  return new_cart
end

def apply_coupons(cart, coupons)
  counter = 0
  while counter < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    coupon_item = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(coupon_item, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else
        cart_item_with_coupon = {
          :item => coupon_item,
          :price => coupons[counter][:cost]/coupons[counter][:num],
          :count => coupons[counter][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end
    end
    counter += 1
  end
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
return cart
end

def apply_clearance(cart)
  counter = 0
  while counter < cart.length
    if cart[counter][:clearance]
        cart[counter][:price] = (cart[counter][:price] - (cart[counter][:price] * 0.2)).round(2)
    end
    counter += 1
  end
  return cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  discount_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(discount_cart)
  total = 0
  counter = 0
   while counter < final_cart.length
     total += final_cart[counter][:price] * final_cart[counter][:count]

     counter += 1
   end
   if total > 100.00
     total -= (total * 0.10)
   end
   return total
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
