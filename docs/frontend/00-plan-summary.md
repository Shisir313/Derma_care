# DermaCare Frontend - Implementation Plan Summary

## Project Overview

**DermaCare** is a personalized skincare and dermatology consultation app for users in Nepal. This documentation covers the complete frontend implementation plan.

**Status**: Planning Complete ✅ | Ready for Implementation

---

## Quick Reference

### Key Decisions
- **Brand**: DermaCare (not "GLOW")
- **Currency**: NPR (shown as "Rs"), stored as integer paisa
- **Timezone**: Asia/Kathmandu (UTC+5:45), shown as "NPT"
- **Sample Data**: Nepali names (Sujana, Triyog, Rasmi), Kathmandu context

### Technical Stack
- Flutter SDK: ^3.13.4
- State Management: Riverpod 2.x
- Navigation: go_router 14.x
- Models: Freezed + json_serializable
- Local Storage: flutter_secure_storage + shared_preferences
- Notifications: flutter_local_notifications (real, working on-device)

### Architecture
- **Feature-first folders**: `features/auth`, `features/onboarding`, etc.
- **Repository pattern**: Abstract interfaces + fake implementations
- **Backend-ready**: Swapping to real API = provider overrides only

---

## Documentation Files

1. **`01-ux-flows.md`**: User journey diagrams (Mermaid) for 3 personas
2. **`02-screen-spec.md`**: Complete specifications for 42+ screens
3. **`03-design-system.md`**: Material 3 design tokens, components, accessibility
4. **`04-architecture.md`**: Folder structure, state management, routing, data layer
5. **`05-domain-models.md`**: Freezed models for all features with validation
6. **`api-contract-draft.md`**: 42 REST API endpoints for future Django backend
7. **`06-test-plan.md`**: Unit, widget, integration, golden, and accessibility tests
8. **`07-roadmap.md`**: 7 milestones (M0-M6), 8-10 weeks timeline
9. **`08-open-questions.md`**: 20 prioritized questions with recommendations

---

## Milestones

### M0: Project Setup + Theme + Routing (3-5 days)
Foundation: dependencies, folders, design system, routing, shared widgets

### M1: Auth + Consent + Onboarding (7-10 days)
Sign up → consent → 5-step onboarding → home

### M2: Home + Routine + Hydration + Notifications (7-10 days)
Dashboard, routine tasks, water logging, local reminders

### M3: Care + Plans + Checkout (7-10 days)
View plans, purchase membership (mock payment)

### M4: Doctors + Booking + Appointment (7-10 days)
Browse doctors, book appointment, video consultation placeholder

### M5: Prescription + Progress + Check-ins (5-7 days)
View prescription, 4-week progress tracking, weekly photo submissions

### M6: Profile + Accessibility + Polish (5-7 days)
Profile management, privacy, WCAG AA compliance, final polish

---

## Screen Inventory (42+ screens)

### Auth & Onboarding (13 screens)
Splash, Login, Sign up, Forgot password, Consent, Onboarding steps 1-5, Profile summary

### Main App (29+ screens)
Home, Routine, Care (multiple states), Plans, Checkout, Payment gateway, Payment result variants, Membership confirmed, Doctor list, Doctor details, Appointment confirmation, Appointment booked, Video consultation, Prescription, Progress tracking, Weekly check-in, Profile, Edit profile, Skin profile, Hydration settings, Routine reminders, Consent & privacy, Delete data

### Plus all empty/loading/error/offline states for data-driven screens

---

## Personas (Sample Data)

1. **Sujana Shrestha** (19, student)
   - Skin: Oily, acne
   - Journey: Basic membership (Rs 399), 1 consultation, 4 check-ins

2. **Triyog Shrestha** (28, professional)
   - Skin: Dry, pigmentation
   - Journey: Premium membership (Rs 499), 2 consultations, routine review

3. **Rasmi Thapa** (40, teacher/parent)
   - Skin: Sensitive
   - Journey: Pay-per-consultation (Rs 200), no membership

---

## Critical Implementation Notes

### Time Handling
- Store in UTC, display in NPT (UTC+5:45)
- Daily resets at midnight NPT
- Use `timezone` package with 'Asia/Kathmandu'

### Currency Handling
- Store as integer paisa (Rs 399 = 39900)
- Never use float for money arithmetic
- Format with `CurrencyUtils.formatNpr()`

### Notifications
- Real local notifications (hydration, routine, appointments)
- Request permissions (Android 13+, iOS)
- Document limitations (battery optimization, iOS background delivery)

### Navigation Guards
- Auth guard → login if no token
- Consent guard → consent if not accepted (v1.0)
- Onboarding guard → onboarding if incomplete

### Testing
- 80%+ coverage goal for business logic
- Run `flutter analyze` (must be clean) after each milestone
- Integration tests for 3 persona journeys
- Accessibility tests (WCAG AA compliance)

---

## Next Steps

1. ✅ Create documentation (this file and 8 others)
2. ⏳ Implement M0: Project setup + theme + routing
3. ⏳ Implement M1: Auth + consent + onboarding
4. ⏳ Continue through M2-M6
5. ⏳ Final testing and polish

---

## Deliverable

At the end of M6, you'll have:
- Fully functional Flutter app with 42+ screens
- Complete auth/onboarding flow
- Membership purchase (mock payment)
- Doctor booking and appointments
- Video consultation placeholder
- Prescription view
- Weekly check-ins (4-week progress)
- Profile management and privacy controls
- WCAG AA accessible
- 80%+ test coverage
- Backend-ready architecture

**Ready for**: Backend integration, QA, deployment to TestFlight/Internal Testing

---

**Last Updated**: 2026-11-21  
**Status**: Planning Phase Complete, Ready to Execute M0
