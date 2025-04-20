# 📝 Personal Task Tracker

A lightweight Flutter application for managing personal tasks with authentication and Supabase backend integration. Built for the **Techstax Flutter Developer Assignment**.

---

## 📂 Project Structure

```
lib/
├── app/               # App-wide styles and themes
│   ├── colors.dart
│   ├── fonts.dart
│   └── theme.dart
├── auth/              # Authentication logic and UI
│   ├── auth_service.dart
│   ├── login_screen.dart
│   └── signup_screen.dart
├── dashboard/         # Task management UI and model
│   ├── add_task_screen.dart
│   ├── dashboard_screen.dart
│   ├── task_model.dart
│   └── task_tile.dart
├── provider/          # State management with Provider
│   ├── task_provider.dart
│   └── user_provider.dart
├── services/          # Supabase service for API interaction
│   └── supabase_service.dart
└── main.dart          # Entry point of the app

pubspec.yaml           # Dependency manager
```

## 🚀 Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/the-shreyashmaurya/Personal_Task_Tracker.git
   cd Personal_Task_Tracker
   ```
2. **Install Flutter dependencies:**:
   ```bash
   flutter pub get
   ```

3. **Create .env file in root directory with your Supabase credentials:**:
   ```bash
   SUPABASE_URL=https://your-project.supabase.co
   SUPABASE_ANON_KEY=your-anon-key
   ```

4. **Run the Application:**:
   ```bash
   flutter run
   ```

   ---
## 🛠️ Supabase Setup


1. **Go to Supabase and create a new project.**:
 
2. **Navigate to Table Editor > Create Table and define the following schema for tasks**:

   ```sql
   create table tasks (
   id uuid primary key default uuid_generate_v4(),
   user_id uuid not null,
   title text,
   description text,
   is_complete boolean default false,
   created_at timestamp with time zone default timezone('utc'::text, now())
   );
   ```

1. **Go to Project Settings > API and copy your:**:

   - Project URL → used as SUPABASE_URL 
   - Anon public key → used as SUPABASE_ANON_KEY

---

## Hot Reload vs Hot Restart in Flutter  

Understand the key differences between Flutter's two most used development features:  

| Feature          | Hot Reload 🔄                          | Hot Restart 🔁                     |
|------------------|----------------------------------------|------------------------------------|
| **Speed**        | ⚡ Faster (injects code into running VM) | 🐢 Slower (rebuilds entire app)    |
| **State**        | 💾 Preserves current app state          | 🗑️ Resets app state completely     |
| **Usage**        | UI updates, minor code tweaks           | State/logic initialization changes |
| **Best For**     | Real-time UI design & minor debugging   | Structural/state-related changes   |  

---

### 🗝️ Key Takeaways  
  - Use **Hot Reload** (`r` in terminal) when:  
    - Tweaking UI elements (colors, layouts)  
    - Making small logic changes  
    - Want to preserve app state  

  - Use **Hot Restart** (`R` in terminal) when:  
    - Modifying app initialization  
    - Changing state management setup  
    - Adding/removing dependencies  

---

## 🏆 Contributing

We welcome contributions! If you’d like to improve GestureX, feel free to fork the repository and create a pull request.

---

## 📄 License

See `LICENSE` for details.

