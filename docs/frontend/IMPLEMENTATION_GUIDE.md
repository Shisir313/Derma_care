# DermaCare Frontend - Implementation Guide

This guide provides the complete implementation plan for the DermaCare Flutter application.

## Documentation Structure

All planning documents are in `docs/frontend/`:
- `00-plan-summary.md` - Quick reference and overview
- `01-ux-flows.md` - User journey diagrams (to be created with full Mermaid flows)
- `02-screen-spec.md` - Complete screen specifications (to be created with full details)
- `03-design-system.md` - Material 3 design tokens (to be created with full palette)
- `04-architecture.md` - Technical architecture (to be created with folder structure)
- `05-domain-models.md` - Domain models with validation (to be created with all entities)
- `api-contract-draft.md` - API endpoint documentation (to be created with 42 endpoints)
- `06-test-plan.md` - Testing strategy (to be created with test cases)
- `07-roadmap.md` - Development milestones (to be created with timeline)
- `08-open-questions.md` - Questions and decisions (to be created with Q&A)

## Execution Plan

### Phase 1: Documentation (Current)
✅ Create `docs/frontend/` directory
✅ Create plan summary
⏳ Create remaining 9 documentation files
⏳ Verify all planning content is captured

### Phase 2: Milestone 0 - Foundation (3-5 days)
Tasks:
1. Update `pubspec.yaml` with all dependencies
2. Create feature-first folder structure
3. Set up strict lints
4. Implement design system (theme, colors, typography)
5. Implement routing with go_router
6. Create shared widgets library
7. Run tests and verify `flutter analyze` clean

### Phase 3: Milestone 1 - Auth + Onboarding (7-10 days)
Build complete authentication and onboarding flow

### Phase 4: Milestone 2 - Home + Routine + Hydration (7-10 days)
Build main dashboard with local notifications

### Phase 5: Milestone 3 - Care + Plans + Checkout (7-10 days)
Build membership purchase flow with mock payment

### Phase 6: Milestone 4 - Doctors + Appointments (7-10 days)
Build doctor booking and video consultation placeholder

### Phase 7: Milestone 5 - Prescription + Progress (5-7 days)
Build prescription view and weekly check-ins

### Phase 8: Milestone 6 - Profile + Polish (5-7 days)
Build profile management, accessibility, final polish

## Key Implementation Principles

### 1. Backend-Ready Architecture
- Define abstract repository interfaces
- Implement fake repositories with realistic Nepali sample data
- Document all API endpoints in `api-contract-draft.md`
- Switching to real backend = provider overrides only, zero UI changes

### 2. Nepali Context Throughout
- Sample users: Sujana Shrestha, Triyog Shrestha, Rasmi Thapa
- Sample doctors: Dr. Anjali Sharma, Dr. Rajesh Poudel, Dr. Suman Thapa
- Locations: Kathmandu context
- Languages: Nepali, English, Hindi
- No Western placeholder names (no "Sarah Jenkins", "John Doe")

### 3. Time and Currency Handling
- **Time**: Store UTC, display NPT (UTC+5:45)
- **Currency**: Store integer paisa (Rs 399 = 39900), format as "Rs XXX"
- **Never** use floats for money arithmetic

### 4. Real Local Notifications
- Hydration reminders (every 2 hours within active hours)
- Routine reminders (morning 7am, evening 7pm NPT)
- Appointment reminders (15min and 5min before)
- Request permissions properly
- Document limitations

### 5. Privacy-First UX
- Explicit consent screen (versioned v1.0)
- "Delete my data" option in profile
- Photo usage explanations
- "Advisory, not diagnosis" disclaimers on assessments

### 6. Accessibility (WCAG AA)
- Minimum 48dp touch targets
- 4.5:1 contrast ratio for normal text
- Semantic labels on all interactive elements
- Test with TalkBack (Android) and VoiceOver (iOS)
- Support 1.0x to 2.0x text scaling

### 7. Testing Requirements
- Unit tests for business logic (80%+ coverage)
- Widget tests for all screens and components
- Integration tests for 3 persona journeys
- Golden tests for design system
- Accessibility tests
- `flutter analyze` must be clean after each milestone

## Development Workflow

### After Each Milestone
1. Run `flutter analyze` - must pass with 0 issues
2. Run `flutter test` - all tests must pass
3. Verify app builds and runs
4. Test on physical device (Android and/or iOS)
5. Document any deferred items
6. Wait for "continue" before next milestone

### Code Quality Standards
- No hardcoded strings (use intl for localization-ready)
- No hardcoded colors (use theme tokens)
- No floats for currency
- All DateTime stored as UTC
- Proper error handling (network failures, validation errors)
- Loading/empty/error/offline states for all data-driven screens

## Sample Data Guidelines

### Users (Auth)
```dart
// Sujana - Student, Basic membership
User(
  id: 'user_001',
  name: 'Sujana Shrestha',
  email: 'sujana@example.com',
  dateOfBirth: DateTime(2005, 2, 15), // 19 years old
  gender: Gender.female,
)

// Triyog - Professional, Premium membership
User(
  id: 'user_002',
  name: 'Triyog Shrestha',
  email: 'triyog@example.com',
  dateOfBirth: DateTime(1996, 5, 10), // 28 years old
  gender: Gender.male,
)

// Rasmi - Teacher, Pay-per-consultation
User(
  id: 'user_003',
  name: 'Rasmi Thapa',
  email: 'rasmi@example.com',
  dateOfBirth: DateTime(1984, 8, 20), // 40 years old
  gender: Gender.female,
)
```

### Doctors
```dart
// Dr. Sharma - Acne specialist
Doctor(
  id: 'doctor_001',
  name: 'Anjali Sharma',
  qualifications: 'MBBS, MD Dermatology',
  languages: ['Nepali', 'English', 'Hindi'],
  specialties: ['Acne', 'Oily skin', 'Hyperpigmentation'],
  yearsOfExperience: 8,
  clinicName: 'Kathmandu Skin Clinic',
  availabilityStatus: AvailabilityStatus.available,
)
```

### Plans
```dart
// Basic Plan
Plan(
  id: 'plan_basic',
  name: 'Basic',
  priceInPaisa: 39900, // Rs 399
  durationWeeks: 4,
  features: [
    'Personalized routine guidance',
    'Hydration tracking & reminders',
    '1 video consultation',
    '4 weekly check-ins',
  ],
)

// Premium Plan
Plan(
  id: 'plan_premium',
  name: 'Premium',
  priceInPaisa: 49900, // Rs 499
  durationWeeks: 4,
  features: [
    'All Basic features',
    '2 video consultations',
    'Routine review by dermatologist',
  ],
)
```

## Critical Reminders

### ⚠️ Do NOT
- Use floats for currency calculations
- Store times in local timezone (always UTC)
- Hardcode strings (use intl/ARB files)
- Skip error states (network failures happen)
- Ignore accessibility (required for launch)
- Add features not in screen inventory (without asking)

### ✅ Do
- Store currency as integer paisa
- Store time as UTC, display as NPT
- Externalize all strings
- Implement all states (loading/empty/error/offline)
- Test with screen readers
- Follow the roadmap strictly

## Questions During Implementation?

If uncertain about:
- **Package APIs**: Check pub.dev documentation, mark as "ASSUMPTION" if unclear
- **Design decisions**: Refer to design system doc, ask if ambiguous
- **Business logic**: Refer to screen specs, ask if unclear
- **Scope**: Only build what's in screen inventory, ask before adding features

## Success Criteria (End of M6)

- [ ] All 42+ screens implemented
- [ ] Auth with guards (consent, onboarding)
- [ ] Complete 5-step onboarding
- [ ] Home dashboard with routine + hydration
- [ ] Real local notifications working
- [ ] Membership purchase (mock payment)
- [ ] Doctor booking and appointment flow
- [ ] Video consultation placeholder
- [ ] Prescription view
- [ ] 4-week progress tracking with check-ins
- [ ] Profile management with delete option
- [ ] WCAG AA accessible
- [ ] 80%+ test coverage
- [ ] `flutter analyze` clean
- [ ] App runs on Android and iOS
- [ ] Ready for backend integration

---

**Ready to begin Milestone 0: Project Setup + Theme + Routing**

Next step: Update `pubspec.yaml` with all dependencies and begin implementation.
