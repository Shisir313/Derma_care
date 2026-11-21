# Milestone 1: Authentication + Onboarding - IN PROGRESS

**Status:** Partially Complete (40%)  
**Started:** November 21, 2026

## Completed So Far ✅

### 1. Error Handling Infrastructure
- `lib/core/errors/app_exception.dart` - Freezed-based exception types
- `lib/core/errors/failure.dart` - Failure type for Result pattern
- `lib/core/utils/result.dart` - Type-safe Result<T> with Success/Error cases

### 2. Storage Services
- `lib/core/storage/secure_storage_service.dart` - Token & sensitive data storage
- `lib/core/storage/local_storage_service.dart` - App preferences storage

### 3. Auth Domain Models
- `lib/features/auth/domain/models/user.dart` - User model with Freezed
- `lib/features/auth/domain/models/auth_tokens.dart` - Token management
- `lib/features/auth/domain/models/login_request.dart` - Login/Register DTOs

### 4. Auth Repository Layer
- `lib/features/auth/data/repositories/auth_repository.dart` - Abstract interface
- `lib/features/auth/data/repositories/fake_auth_repository.dart` - Full fake implementation with:
  - 3 pre-loaded test users (Sujana, Triyog, Rasmi)
  - 1-2s simulated network delay
  - 10% random failure rate
  - All auth methods: login, register, logout, profile update, password change, etc.

### 5. Auth State Management
- `lib/features/auth/presentation/providers/auth_provider.dart` - Riverpod state management:
  - AuthState class
  - AuthNotifier with login/register/logout/updateProfile
  - Convenience providers: currentUserProvider, isAuthenticatedProvider, needsOnboardingProvider

## Remaining Tasks 📋

### 6. Form Validation Utilities
- [ ] Create `lib/core/utils/validators.dart`
  - Phone validator (Nepal format)
  - Password validator (min 8 chars)
  - Name validator
  - Email validator

### 7. Input Widgets
- [ ] Create `lib/core/widgets/inputs/text_field.dart` - Custom TextField with validation
- [ ] Create `lib/core/widgets/inputs/phone_field.dart` - Nepal phone input
- [ ] Create `lib/core/widgets/inputs/password_field.dart` - Password with visibility toggle

### 8. Login Screen
- [ ] Create `lib/features/auth/presentation/screens/login_screen.dart` (full implementation)
  - Phone number input (Nepal format)
  - Password input with show/hide
  - Login button with loading state
  - "Forgot Password?" link
  - "Don't have an account? Register" link
  - Form validation
  - Error display

### 9. Register Screen
- [ ] Create `lib/features/auth/presentation/screens/register_screen.dart`
  - Name input
  - Phone number input
  - Email input (optional)
  - Password input
  - Confirm password
  - Register button with loading
  - "Already have an account? Login" link
  - Terms & privacy policy checkbox

### 10. Forgot Password Flow
- [ ] Create forgot_password_screen.dart
- [ ] Create reset_password_screen.dart
- [ ] Add routes to router

### 11. Onboarding Domain Models
- [ ] Create `lib/features/onboarding/domain/models/skin_profile.dart`
- [ ] Create `lib/features/onboarding/domain/models/lifestyle_profile.dart`
- [ ] Create `lib/features/onboarding/domain/models/hydration_profile.dart`

### 12. Onboarding Screens (6 screens)
- [ ] onboarding_welcome_screen.dart - App introduction
- [ ] skin_profile_screen.dart - Skin type, concerns, goals
- [ ] lifestyle_screen.dart - Sleep, stress, activity
- [ ] hydration_screen.dart - Water intake, weight
- [ ] consent_screen.dart - Privacy policy, data usage
- [ ] onboarding_complete_screen.dart - Success message, CTA

### 13. Onboarding Repository
- [ ] Create fake onboarding repository
- [ ] Onboarding state management with Riverpod

### 14. Router Updates
- [ ] Update app_router.dart with redirect logic:
  - Not authenticated → login
  - Authenticated but not onboarded → onboarding
  - Authenticated and onboarded → home
- [ ] Add all auth and onboarding routes

### 15. Integration & Testing
- [ ] Fix build_runner code generation (Freezed/JSON)
- [ ] Run flutter analyze (must pass with 0 issues)
- [ ] Manual testing: login, register, onboarding flow
- [ ] Update main.dart to initialize SharedPreferences

## Known Issues ⚠️

1. **Build Runner Timeout**
   - `dart run build_runner build` is timing out
   - Issue: Analyzer version mismatch (SDK 3.13.0 vs analyzer 3.9.0)
   - Workaround: Manually create generated files OR update dependencies
   - Impact: Freezed .freezed.dart and .g.dart files not generated yet
   - Solution: Need to run `flutter pub upgrade` or create manual copyWith methods

2. **Dependencies Need Updating**
   - 53 packages have newer versions
   - Some may fix the analyzer issue
   - Recommendation: Run `flutter pub upgrade` after M1 foundation is complete

## File Count So Far
- **Files created in M1:** 10 new files
- **Total lines:** ~1,000 (excluding comments)
- **Completion:** ~40% of M1 tasks done

## Next Steps

1. **Immediate:** Fix build_runner issue
   - Option A: Run `flutter pub upgrade --major-versions`
   - Option B: Manually create minimal copyWith/fromJson methods
   - Option C: Continue without generated code, fix later

2. **After fix:** Create form validators and input widgets

3. **Then:** Build login/register screens

4. **Finally:** Onboarding flow

## Estimated Time Remaining
- Validators + Inputs: 1-2 hours
- Auth screens: 3-4 hours
- Onboarding: 4-5 hours
- Testing & polish: 2-3 hours
- **Total:** 10-14 hours remaining

---

**User Action Required:**
- Review this progress
- Decide on build_runner fix approach
- Type "continue" to resume M1 implementation
