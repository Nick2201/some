CREATE TABLE "Product" (
  "id" int PRIMARY KEY,
  "name" string,
  "description" string,
  "category" string,
  "price" decimal,
  "quantity" int,
  "supplier_id" int,
  "Warehouse_id" int
);

CREATE TABLE "Supplier" (
  "id" int PRIMARY KEY,
  "name" string,
  "contactInfo" string,
  "address" string
);

CREATE TABLE "Order" (
  "id" int PRIMARY KEY,
  "date" date,
  "status" string,
  "totalAmount" decimal,
  "Employeeid" int,
  "Warehouse_id" int,
  "customer_id" int
);

CREATE TABLE "Customer" (
  "id" int PRIMARY KEY,
  "firstName" string,
  "lastName" string,
  "contactInfo" string,
  "address" string
);

CREATE TABLE "Purchase" (
  "id" int PRIMARY KEY,
  "order_id" int,
  "product_id" int,
  "quantity" int,
  "unitPrice" decimal,
  "totalPrice" decimal,
  "supplier_id" int,
  "Warehouse_id" int,
  "PaymentMethodid" int
);

CREATE TABLE "Payment" (
  "id" int PRIMARY KEY,
  "order_id" int,
  "paymentMethod" string,
  "amount" decimal,
  "date" date,
  "PaymentMethodid" int
);

CREATE TABLE "Warehouse" (
  "id" int PRIMARY KEY,
  "name" string,
  "address" string,
  "contactInfo" string
);

CREATE TABLE "Employee" (
  "id" int PRIMARY KEY,
  "firstName" string,
  "lastName" string,
  "position" string,
  "contactInfo" string,
  "salary" decimal,
  "Departmentid" int,
  "Warehouse_id" int
);

CREATE TABLE "Department" (
  "id" int PRIMARY KEY,
  "name" string,
  "description" string
);

CREATE TABLE "Category" (
  "id" int PRIMARY KEY,
  "name" string,
  "description" string
);

CREATE TABLE "Shipping" (
  "id" int PRIMARY KEY,
  "order_id" int,
  "date" date,
  "status" string
);

CREATE TABLE "PaymentMethod" (
  "id" int PRIMARY KEY,
  "name" string,
  "description" string
);

CREATE TABLE "ProductCategory" (
  "product_id" int,
  "category_id" int
);

CREATE TABLE "CustomerOrder" (
  "customer_id" int,
  "order_id" int
);

ALTER TABLE "Product" ADD FOREIGN KEY ("supplier_id") REFERENCES "Supplier" ("id");

ALTER TABLE "Product" ADD FOREIGN KEY ("Warehouse_id") REFERENCES "Warehouse" ("id");

ALTER TABLE "Purchase" ADD FOREIGN KEY ("supplier_id") REFERENCES "Supplier" ("id");

ALTER TABLE "Purchase" ADD FOREIGN KEY ("Warehouse_id") REFERENCES "Warehouse" ("id");

ALTER TABLE "Purchase" ADD FOREIGN KEY ("PaymentMethodid") REFERENCES "PaymentMethod" ("id");

ALTER TABLE "Purchase" ADD FOREIGN KEY ("order_id") REFERENCES "Order" ("id");

ALTER TABLE "Payment" ADD FOREIGN KEY ("PaymentMethodid") REFERENCES "PaymentMethod" ("id");

ALTER TABLE "Order" ADD FOREIGN KEY ("Employeeid") REFERENCES "Employee" ("id");

ALTER TABLE "Order" ADD FOREIGN KEY ("Warehouse_id") REFERENCES "Warehouse" ("id");

ALTER TABLE "Order" ADD FOREIGN KEY ("customer_id") REFERENCES "Customer" ("id");

ALTER TABLE "ProductCategory" ADD FOREIGN KEY ("product_id") REFERENCES "Product" ("id");

ALTER TABLE "ProductCategory" ADD FOREIGN KEY ("category_id") REFERENCES "Category" ("id");

ALTER TABLE "CustomerOrder" ADD FOREIGN KEY ("customer_id") REFERENCES "Customer" ("id");

ALTER TABLE "CustomerOrder" ADD FOREIGN KEY ("order_id") REFERENCES "Order" ("id");

ALTER TABLE "Payment" ADD FOREIGN KEY ("order_id") REFERENCES "Order" ("id");

ALTER TABLE "ProductCategory" ADD FOREIGN KEY ("product_id") REFERENCES "ProductCategory" ("category_id");
