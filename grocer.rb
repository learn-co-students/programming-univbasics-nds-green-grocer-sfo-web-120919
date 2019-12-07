require 'pp'

def find_item_by_name_in_collection(name, collection)
  items = 0

  while items < collection.length
    if collection[items][:item] == name
      return collection[items]
    end
      items += 1
  end
      return nil
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  new_arr = []
  total = 0

  while total < cart.length
    new_item = find_item_by_name_in_collection(cart[total][:item], new_arr)

    if new_item != nil
      new_item[:count] += 1
    else
      new_item = {
      :item => cart[total][:item],
      :price => cart[total][:price],
      :clearance => cart[total][:clearance],
      :count => 1
    }

    new_arr << new_item

  end

  total += 1
end

  return new_arr
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  total = 0
  while total < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[total][:item], cart)
    coupon_item = "#{coupons[total][:item]} W/COUPON"
    cart_coupon = find_item_by_name_in_collection(coupon_item, cart)

    if cart_item && cart_item[:count] >= coupons[total][:num]

      if cart_coupon
        cart_coupon[:count] += coupons[total][:num]
        cart_item[:count] -= coupons[total][:num]
      else
        cart_coupon = {
          :item => coupon_item,
          :price => coupons[total][:cost] / coupons[total[:num],
          :count => coupons[total][:num],
          :clearance => cart_item[:clearance]
        }
        cart << cart_coupon
        cart_item[:count] -= coupons[total][:num]
      end

    end

    total += 1

  end

  return cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  total = 0
  while total < cart.length

    if cart[total][:clearance]
        cart[total][:price] = (cart[total][:price] - (cart[total][:price] * 0.2)).round(2)
    end

    total += 1

  end

  return cart

  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  discounted = apply_coupons(consolidated_cart, coupons)
  total_cart = apply_clearance(discounted)
  total = 0
  new_arr = 0
   while new_arr < total_cart.length
     total += total_cart[new_arr][:price] * total_cart[new_arr][:count]

     new_arr += 1
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
