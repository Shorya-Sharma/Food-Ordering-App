# 🍽️ Food Ordering App

A full-stack food ordering application with a Flutter frontend and a Spring Boot backend, powered by a PostgreSQL database. The app allows users to browse menus, order food, receive personalized recommendations, and make payments via Zalo Pay. Admins can manage dishes and view statistical insights.

---

## 📝 Overview

This project is a comprehensive food ordering platform featuring:
- **User Ordering System:** Browse, select, and order food online.
- **Recommendation Engine:** Personalized dish recommendations using content-based filtering.
- **Admin Management:** Create and manage dishes, group options, and orders.
- **Payment Integration:** Secure payments via Zalo Pay.
- **Statistical Analysis:** Insights into orders, revenue, and user preferences.

---

## 💻 Technologies Used

- **Frontend:** Flutter
- **Backend:** Spring Boot
- **Database:** PostgreSQL

---

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install)
- [Spring Boot](https://spring.io/projects/spring-boot)
- [PostgreSQL](https://www.postgresql.org/download/)

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-repo/Food-Ordering-App.git
   cd Food-Ordering-App
   ```

2. **Frontend Setup (Flutter)**
   - Navigate to the `app/` directory:
     ```bash
     cd app
     ```
   - Install dependencies:
     ```bash
     flutter pub get
     ```
   - Run the app:
     ```bash
     flutter run
     ```
   - For more Flutter resources:
     - [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
     - [Flutter Cookbook](https://docs.flutter.dev/cookbook)

3. **Backend Setup (Spring Boot)**
   - Navigate to the `backend/` directory:
     ```bash
     cd ../backend
     ```
   - Configure your PostgreSQL database connection in `src/main/resources/application.properties`.
   - Start the backend server:
     ```bash
     ./mvnw spring-boot:run
     ```

---

## ✨ Features

- **Ordering System:** Browse and order food items online.
- **Recommendation System:** Content-based filtering for personalized dish suggestions.
- **Admin Tools:** Create dishes, group options, and manage orders.
- **Zalo Pay Payments:** Integrated payment processing.
- **Statistics:** View order, revenue, and user analytics.

---

## ⚙️ API Endpoints

- `/dishes`: CRUD operations for dishes.
- `/orders`: Place and manage orders.
- `/payments`: Process payments via Zalo Pay.
- `/statistics`: Access statistical data.

---

## 📖 Usage

- **Users:** Browse the menu, select dishes, and place orders.
- **Admins:** Create/manage dishes and orders.
- **Security:** Ensure authentication and authorization are configured for secure access.

---

## 📸 Screenshots
**Home Screen, Menu Screen, and Dish Detail Screen**
<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/7d4bb1f2-2e54-4e52-8fe4-84cbbf348c3c" alt="Home Screen" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/4343cc24-be3b-4faa-9425-69fe506c28d2" alt="Menu Screen" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/cbd41ca5-2cc8-42d0-b2c0-4d9b9bc02265" alt="Dish Detail Screen" style="width: 30%;">
</div>

**Cart Screen, Order Confirmation Screen, and Order History Screen**
<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/55342875-6807-4891-b48f-e4218fa3a350" alt="Cart Screen" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/7ee60a66-2ac3-4eeb-9235-76566f83b391" alt="Order Confirmation Screen" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/a57a841c-0192-4a46-a5f7-67f100287bdd" alt="Order History Screen" style="width: 30%;">
</div>

**Additional Screenshots**
<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/eb2b6852-9297-476e-8eca-88d6a8a1b44b" alt="Screenshot 1" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/170e86a2-2389-4a9d-9103-f2da87ea1824" alt="Screenshot 2" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/7200a09e-1c1a-48d2-b502-23240d1b23c5" alt="Screenshot 3" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/6e5ff37a-1d3a-4c30-bbb7-43331e459443" alt="Screenshot 4" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/1934e5ea-9687-46e3-b2c5-664e6d86cd41" alt="Screenshot 5" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/d1766811-de66-4ccf-a395-ea449c3389f2" alt="Screenshot 6" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/b194be75-181f-4bc3-a1a8-44e9b290d6fc" alt="Screenshot 7" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/5a4e437f-e763-459a-8648-50f5cb0576c3" alt="Screenshot 8" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/aa459b94-caed-40a0-93f6-69d8d5fde3ea" alt="Screenshot 9" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/3005f486-88ba-4c15-af72-d9ef8351051f" alt="Screenshot 10" style="width: 30%;">
  <img src="https://github.com/vocongbinh/food_delivery_app/assets/93437219/027c99e3-95d7-4242-96e4-05aac611f456" alt="Screenshot 11" style="width: 30%;">
</div>

---

## 📄 License

This project is licensed under the [MIT License](LICENSE). 