// Creating tables
Table Product {
  id_product int [pk]
  name string
  description string
  category string
  price decimal
  quantity int
  supplier_id int
  Warehouse_id int
}

Table Supplier {
  id_supplier int [pk]
  name string
  contactInfo string
  address string
}

Table Order {
  id_order int [pk]
  date date
  status string
  totalAmount decimal
  id_employee int
  id_warehouse int
  id_customer int
}

Table Customer {
  id_customer int [pk]
  first_name string
  last_name string
  contactInfo string
  address string
}

Table Purchase {
  id_purchase int [pk]
  id_order int
  id_product int
  quantity int
  unitPrice decimal
  totalPrice decimal
  id_supplier int
  id_warehouse int
  id_paymentMethod int
}

Table Payment {
  id_payment int [pk]
  id_order int
  paymentMethod string
  amount decimal
  date date
  id_paymentMethod int
}

Table Warehouse {
  id_warehouse int [pk]
  name string
  address string
  contactInfo string
}

Table Employee {
  id_employee int [pk]
  first_name string
  last_name string
  position string
  contactInfo string
  salary decimal
  id_department int
  id_warehouse int
}

Table Department {
  id_department int [pk]
  name string
  description string
}

Table Category {
  id_category int [pk]
  name string
  description string
}

Table Shipping {
  id_shipping int [pk]
  id_order int
  date date
  status string
}

Table PaymentMethod {
  id_paymentMethod int [pk]
  name string
  description string
}

Table ProductCategory {
  id_product_category int [pk]
  id_product int
  id_category int
}

Table CustomerOrder {
  id_customer_order int [pk]
  id_customer int
  id_order int
}

// Creating references
Ref: Product.supplier_id > Supplier.id_supplier
Ref: Product.Warehouse_id > Warehouse.id_warehouse
Ref: Purchase.id_supplier > Supplier.id_supplier
Ref: Purchase.id_warehouse > Warehouse.id_warehouse
Ref: Purchase.id_paymentMethod > PaymentMethod.id_paymentMethod
Ref: Purchase.id_order > Order.id_order
Ref: Payment.id_paymentMethod > PaymentMethod.id_paymentMethod
Ref: Payment.id_order > Order.id_order
Ref: Purchase.id_product > ProductCategory.id_product
Ref: Order.id_employee > Employee.id_employee
Ref: Order.id_warehouse > Warehouse.id_warehouse
Ref: Order.id_customer > Customer.id_customer
Ref: ProductCategory.id_category > Category.id_category
Ref: ProductCategory.id_product > Product.id_product
Ref: CustomerOrder.id_customer > Customer.id_customer
Ref: CustomerOrder.id_order > Order.id_order

Ref: Shipping.id_order > Order.id_order
Ref: Employee.id_department > Department.id_department
Ref: Employee.id_warehouse > Warehouse.id_warehouse

// TableGroup
TableGroup e_commerce_group {
    Product
    Supplier
    Order
    Customer
    Purchase
    Payment
    Warehouse
    Employee
    Department
    Category
    Shipping
    PaymentMethod
    ProductCategory
    CustomerOrder
}
