# Customer ERD

```
+-----------------+        +------------------+       +-----------------+
|    Customer     |        |      Order       |       |     Product     |
+-----------------+        +------------------+       +-----------------+
| CustomerID (PK) |        | OrderID (PK)     |       | ProductID (PK)  |
| Name            |        | CustomerID (FK)  |       | Name            |
| Email           |        | OrderDate        |       | Price           |
| Phone           |        | TotalAmount      |       | Description     |
| Address         |        +------------------+       +-----------------+
| Registered      |
| Age             |
+-----------------+
 ____________ 
|OrderDetails|
|____________|___________ 
| PK: OrderID,ProductID  |
| Quantity               |
|________________________|
```