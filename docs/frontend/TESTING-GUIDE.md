# DermaCare Testing Guide

## Quick Start

### Run the App
```bash
flutter run -d PNY5IJUSJVLNN7QW
```

Press `r` to hot reload  
Press `R` to hot restart  
Press `q` to quit

---

## Test Accounts

### Pre-loaded Users (Login Screen)
```
Phone: 9801234567
Password: password123
Name: Sujana Shrestha (Onboarded user)

Phone: 9812345678  
Password: password123
Name: Triyog Shrestha (Onboarded user)

Phone: 9823456789
Password: password123
Name: Rasmi Thapa (Needs onboarding - not onboarded yet)
```

---

## Test Scenarios

### 1️⃣ Login Flow
**Steps:**
1. App opens → Splash screen
2. Navigate to login screen
3. Enter phone: `9801234567`
4. Enter password: `password123`
5. Tap "Login"

**Expected:**
- ✅ Loading spinner shows
- ✅ Success → Navigate to Home screen
- ✅ Bottom nav shows 4 tabs (Home, Routine, Care, Profile)

**Test Edge Cases:**
- ❌ Empty fields → "Phone number is required"
- ❌ Invalid phone (123) → "Phone number must be 10 digits"
- ❌ Wrong password → "Incorrect password" (red snackbar)
- ❌ Unregistered phone → "Phone number not registered"

---

### 2️⃣ Registration Flow
**Steps:**
1. From login screen, tap "Register"
2. Fill form:
   - Name: `Your Name`
   - Phone: `9834567890` (new number)
   - Email: `test@example.com` (optional)
   - Password: `test1234`
   - Confirm: `test1234`
3. Check "I agree to Terms..."
4. Tap "Create Account"

**Expected:**
- ✅ Validation works (try empty fields, mismatched passwords)
- ✅ Success → User created
- ✅ Navigate to Home (should go to onboarding, but not implemented yet)

**Test Edge Cases:**
- ❌ Phone already exists → "Phone number already registered"
- ❌ Password mismatch → "Passwords do not match"
- ❌ Terms not checked → "Please agree to the Terms..."

---

### 3️⃣ Input Validation
**Test Phone Field:**
- Type `123` → Error: "must be 10 digits"
- Type `8012345678` → Error: "must start with 98 or 97"
- Type `9801234567` → ✅ Valid

**Test Password Field:**
- Type `abc` → Error: "at least 8 characters"
- Type `12345678` → ✅ Valid
- Tap eye icon → Password shows/hides

**Test Name Field:**
- Type `A` → Error: "at least 2 characters"
- Type `John@Doe` → Error: "can only contain letters..."
- Type `John Doe` → ✅ Valid

---

### 4️⃣ Navigation
**From Login Screen:**
- Tap "Register" → Go to Register screen
- Tap "Forgot Password?" → Shows "coming soon" message

**From Register Screen:**
- Tap back arrow → Return to Login
- Tap "Login" button → Return to Login

---

### 5️⃣ Loading States
**Test Loading Behavior:**
1. Tap Login button
2. Observe:
   - ✅ Button shows spinner
   - ✅ Button disabled (can't tap again)
   - ✅ Inputs disabled
3. After ~1-2 seconds → Success or error

---

### 6️⃣ Error Handling
**Simulated 10% Random Failures:**
- If login fails randomly → Red snackbar shows error
- Retry works → Can login again immediately

**Network Simulation:**
- Fake repository delays 1-2 seconds
- Simulates real API latency

---

### 7️⃣ Theme Testing
**Light Mode (Default):**
- Sage green primary color (#4A7C59)
- Clean, medical aesthetic
- High contrast text

**Dark Mode (System Setting):**
- Change phone to dark mode
- Restart app
- Should show dark theme (#A3D4B5 primary)

---

### 8️⃣ Onboarding Screens (Manual Navigation)
**Note:** Auto-redirect not implemented, test manually:

**Welcome Screen:**
```
Navigate to: /onboarding
Expected: Welcome message, "Get Started" button
```

**Complete Screen:**
```
Navigate to: /onboarding/complete
Expected: Success icon, "Start Your Journey" button
```

**Other Screens:** Not yet built (Skin, Lifestyle, Hydration, Consent)

---

## Known Issues ⚠️

1. **Splash doesn't auto-navigate** - Will add in router redirect
2. **No onboarding after register** - Needs router logic
3. **Forgot password is placeholder** - Coming in future milestone
4. **Terms/Privacy don't link anywhere** - Coming in M6
5. **Only 2 onboarding screens built** - 4 more needed

---

## Expected Behavior Summary

### ✅ What Works:
- Login with test accounts
- Registration with validation
- Input validation (phone, password, email, name)
- Loading states
- Error messages
- Navigation between login/register
- Theme integration
- Password show/hide
- Form autofill hints

### ⏳ What's Partial:
- Onboarding flow (2/6 screens)
- Router redirects (no auto-navigation yet)

### ❌ What's Not Built:
- Forgot password flow
- Home screen functionality (just placeholder)
- Onboarding screens (4 remaining)
- Profile/routine/care screens

---

## Debugging Tips

### If app doesn't build:
```bash
flutter clean
flutter pub get
flutter run -d PNY5IJUSJVLNN7QW
```

### If you see analyzer errors:
```bash
flutter analyze
# Should show: "No issues found!"
```

### If you see "UnimplementedError":
- This means you hit a feature not yet implemented
- Check which button you tapped
- Likely a placeholder function

### To restart the app:
Press `R` (capital R) in the terminal for hot restart

---

## Test Checklist

- [ ] App launches without crash
- [ ] Can navigate to login screen
- [ ] Login works with test account
- [ ] Validation shows errors correctly
- [ ] Loading spinner appears
- [ ] Error messages show in red snackbar
- [ ] Can navigate to register screen
- [ ] Registration creates new user
- [ ] Password toggle works
- [ ] Theme looks correct (sage green)
- [ ] Bottom nav appears after login
- [ ] Manual navigation to /onboarding works
- [ ] Complete screen shows success message

---

**Ready to test!** Run the app and work through this checklist.  
Report any issues you find! 🐛
