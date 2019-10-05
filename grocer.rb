def consolidate_cart(cart)
  new_cart = {} 
  cart.each do |items_array| 
    items_array.each do |item, attribute_hash| 
      new_cart[item] ||= attribute_hash 
      new_cart[item][:count] ? new_cart[item][:count] += 1 :
      new_cart[item][:count] = 1 
    end 
  end 
new_cart 
end

def apply_coupons(cart, coupons)
 coupons.each do |coupon|
   item = coupon[:item]
   if cart.has_key?(item) 
     if cart[item][:count] >= coupon[:num] && !cart["#{item} W/COUPON"]
       cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clear],count: 
     elsif cart[item][:count] >= coupon[:num] && cart["#{item} W/COUPON"]
       cart["#{item} W/COUPON"][:count] += coupon[:num]
     end
     cart[item][:count] -= coupon[:num]
   end
 end
 cart
end

def apply_clearance(cart)
  cart.each do |item, price_hash|
    if price_hash[:clearance] == true
      price_hash[:price] = (price_hash[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)

end
