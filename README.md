# SQL---Restaurant-Order-Analysis

# 🍽️ Restaurant SQL Analysis

Welcome to the Restaurant SQL Analysis project! This project explores a fictional restaurant's database using SQL to uncover insights related to the menu, order behavior, and sales performance.

---

## 📂 About the Project

This project is designed to:
- Analyze menu prices and categories.
- Investigate ordering trends and high-value orders.
- Identify best-selling dishes.
- Combine menu and order data to provide business recommendations.

---

## 🧠 Key Objectives

1. **Menu Analysis**
   - Total number of dishes
   - Most and least expensive items
   - Italian dish focus
   - Category-wise counts and average pricing

2. **Order Analysis**
   - Date range and total orders
   - Orders with the most items
   - High-volume order filtering

3. **Sales & Revenue Insights**
   - Join `order_details` and `menu_items` to track purchases
   - Identify best and worst-selling dishes
   - Discover top 5 highest-spending orders and their category breakdowns

---

## 🗃️ Database Schema

### `menu_items`
| Column         | Type      | Description                |
|----------------|-----------|----------------------------|
| menu_item_id   | INT (PK)  | Unique ID for menu item    |
| item_name      | VARCHAR   | Name of the dish           |
| category       | VARCHAR   | Dish category              |
| price          | DECIMAL   | Price of the dish          |

### `order_details`
| Column           | Type      | Description                      |
|------------------|-----------|----------------------------------|
| order_details_id | INT (PK)  | Unique ID for the order row      |
| order_id         | INT       | Unique order identifier          |
| item_id          | INT (FK)  | Links to `menu_items.menu_item_id` |
| order_date       | DATE      | Date of the order                |

---

## 📁 Folder Structure


---

## 📌 Notable Insights

- The **most expensive items** and **top-selling dishes** are mostly from the **Italian category**.
- Some **orders contain more than 12 items**, possibly large group purchases.
- High-revenue orders are dominated by **Italian** and **Main Course** items — suggesting these should be prioritized in promotions.

---

## 🛠️ Tools Used

- SQL (MySQL syntax)
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
- Window functions: `RANK()`
- Subqueries and Joins

---

## 📈 Sample Query

```sql
-- Top 5 orders by total revenue
SELECT order_id, SUM(price) AS total_spent
FROM order_details AS od
JOIN menu_items AS mi ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;
