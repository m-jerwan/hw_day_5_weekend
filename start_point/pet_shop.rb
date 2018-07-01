#1
def pet_shop_name(shop)
  return shop[:name]
end

#2
def total_cash(shop)
  return shop[:admin][:total_cash]
end

#3 & #4
def add_or_remove_cash(shop,ammount)
  shop[:admin][:total_cash] += ammount
end

#5
def pets_sold(shop)
  shop[:admin][:pets_sold]
end

#6
def increase_pets_sold(shop,ammount)
  shop[:admin][:pets_sold] += ammount
end

#7
def stock_count(shop)
  shop[:pets].length
end

#8 & #9
def pets_by_breed(shop, breed)
  pets_with_this_breed = []
  for pet in shop[:pets]
    pets_with_this_breed << pet if pet[:breed] == breed
  end
  return pets_with_this_breed
end

#10
def find_pet_by_name(shop, name)
  animal_for_sale = nil
  for animal in shop[:pets]
    if animal[:name] == name
      animal_for_sale = animal
    end
  end
  return animal_for_sale
end

#
def remove_pet_by_name(shop, name)
  pet_im_after = find_pet_by_name(shop, name)
  shop[:pets].delete(pet_im_after)
end

#13
def add_pet_to_stock(shop, pet)
  shop[:pets] << pet
end

#14
def customer_cash(customer)
  return customer[:cash]
end

# #15
def remove_customer_cash(customer, ammount)
    customer[:cash] -= ammount
end

#16
def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  return customer[:cash] > pet[:price]
end

def sell_pet_to_customer(shop, pet, customer)
  if  pet != nil
    if customer_can_afford_pet(customer, pet)
      remove_customer_cash(customer, pet[:price])
      remove_pet_by_name(shop, pet[:name])
      add_pet_to_customer(customer, pet)
      increase_pets_sold(shop, 1)
      add_or_remove_cash(shop, pet[:price])
    end
 end
end
