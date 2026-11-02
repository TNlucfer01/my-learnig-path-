# Feature Analysis and Bug Log

This document tracks the systematic analysis of all application features, focusing on the data contracts between the frontend and backend, and identifying potential bugs.

*Total Features Audited*: 8
*Total Bugs/Issues Logged*: ~18

## Methodology
For each feature, we analyze:
1. **Frontend Request**: What data the frontend sends to the API.
2. **Backend Response**: What data the backend returns to the frontend.
3. **UI Representation**: How the frontend renders this data.
4. **Identified Issues / Potential Bugs**: Discrepancies, missing validations, unhandled edge cases, or broken contracts.

---

## Analyzed Features

### 1. Staff Take Attendance ([features/staff/TakeAttendance.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/staff/TakeAttendance.tsx))
- **Frontend Request (Fetch)**: `POST /attendance/fetch-students`
  - Payload: `{ year, batch_id, batch_type, slot_id, date (YYYY-MM-DD local) }`
- **Frontend Request (Submit)**: `POST /attendance/submit`
  - Payload: `{ records: [{ student_id, status: "PRESENT"|"ABSENT", od_reason: "Uninformed Leave"|"None" }], slot_id, date, subject_id }`
- **Backend Response (Fetch)**: `{ students: [...], remaining_minutes: 20 }`
- **Backend Response (Submit)**: Returns updated students `{ student: [...] }`.
- **UI Representation**: Table rendering students with `PRESENT` / `ABSENT` options. Locked rows (OD/IL set by YC) are disabled and display a "Locked" badge. Uses a frontend countdown timer based on `remaining_minutes`.
- **Identified Issues / Potential Bugs**:
  - **Bug 1 (Security/Validation)**: The 20-minute submission window timer is entirely frontend-enforced. A user could technically bypass the disabled button via DevTools or API tools and submit attendance at any time on the current day. The backend [services/attendance.staff.service.js](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/attendance.staff.service.js) only checks `requireToday(date)`, but does not strictly validate `remaining_minutes`.
  - **Bug 2 (Hardcoded Reason)**: [attendance-staff.api.ts](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/api/attendance-staff.api.ts) hardcodes `od_reason: uppercaseStatus === 'ABSENT' ? 'Uninformed Leave' : 'None'`. If the system ever needs staff to specify reasons, this strict override will block it.

### 2. Add Subject & Subject List ([features/principal/AddSubject.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/principal/AddSubject.tsx))
- **Frontend Request (Add/Fetch)**: `POST /subjects` with `{ subject_name, subject_code, subject_year, semester, credits, subject_description? }`, and `GET /subjects`.
- **Backend Response**: Returns created subject object or array of subjects.
- **UI Representation**: Form at the top to add new subjects, table underneath to list all curriculum subjects along with their credits, timeline (Year/Semester), and Action column (Edit/Delete).
- **Identified Issues / Potential Bugs**:
  - **Bug 1 (Foreign Key Constraint Crash)**: The DELETE route is active, but if a subject is deleted that has existing attendance records (`subject_id` is used in Take Attendance), the database will likely throw a fatal `SequelizeForeignKeyConstraintError` leading to a 500 error on the frontend.
  - **Bug 2 (Missing Unique Validation)**: [subject.service.js](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/subject.service.js)'s [create](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/subject.service.js#22-26) method does not verify if the `subject_code` already exists before inserting. The DB might throw an unhandled `SequelizeUniqueConstraintError`.
  - **Bug 3 (Comment Mismatch)**: The [getById](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/subject.service.js#15-21) service function claims the `:id` parameter is `subject_code`, but actually queries `subject_id`. If someone relies on the comment and sends a string code, the backend will crash on `parseInt`.

### 3. Add Student & Student List ([features/yc/AddStudent.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/yc/AddStudent.tsx))
- **Frontend Request (Add/Fetch)**: `POST /students` Payload: `{ name, roll_number, phone, email, dob, gender, address, parent_phone, current_year, theory_batch_id, lab_batch_id }`.
- **Backend Response**: Returns newly created student object (or array for fetch).
- **UI Representation**: Form on top. Table below showing Roll Number, Name, Theory Batch, Lab Batch, Parent Phone, and Actions.
- **Identified Issues / Potential Bugs**:
  - **Bug 1 (State Drift on Update)**: In [student.service.js](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/student.service.js), the [update](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/student.service.js#68-74) function simply calls `student.update(data)`. If a YC changes a student's `theory_batch_id` or `lab_batch_id` via Edit Student, the system **fails to decrement the old batch capacity and increment the new batch capacity**. The capacities will permanently drift.
  - **Bug 2 (Missing Transactions)**: The [create](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/subject.service.js#22-26) and [remove](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/student.service.js#75-89) methods update the student record and then modify batch capacities. These are sequential await calls without a database transaction. If the server crashes between these queries, batch counts will be corrupted.
  - **Bug 3 (Unsecured Bulk Route)**: The `POST /students/bulk` route is accessible to YCs but skips the [restrictYearToYCScope](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/routes/student.routes.js#36-49) middleware. A malicious or inquisitive YC could send a bulk upload assigning students to years they do not manage (e.g. `current_year: 4` while managing Year 1).
  - **Bug 4 (No Roll Number Uniqueness Catch)**: The [create](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/subject.service.js#22-26) service does not explicitly check for roll number duplication before inserting. Duplicate inserts will either crash with a raw 500 error (if DB unique constraint exists) or create a dirty duplicate (if constraint doesn't exist).

### 4. Attendance Correction ([features/principal/AttendanceCorrection.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/principal/AttendanceCorrection.tsx))
- **Frontend Request**: 
  - Fetch batches for Date+Period: `POST /attendance/getbacthes`
  - Fetch students: `GET /attendance/fetch-students-pri` with `{ year, date, period, batch_id, batch_type }`.
  - Save records: `POST /attendance/save-student-pri` with updated records array.
- **Backend Response**: Returns list of formatted student attendance records.
- **UI Representation**: Filter bar at top. Table below showing roll number, status dropdown, OD/IL reason input, Lock checkbox, and Remarks input.
- **Identified Issues / Potential Bugs**:
  - **Bug 1 (Silent Failure on Unrecorded Students)**: [fetchStudentsPrincipal](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/attendance.principal.service.js#47-89) queries [AttendanceRecord](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/shared/StudentDetailsDialog.tsx#8-18) and joins [Student](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/yc/AddStudent.tsx#51-278). This means it *only returns students who already have an attendance record* for that slot. If a staff member forgot to take attendance completely, the Principal cannot use this screen to fill it in because the students won't even appear. Furthermore, [saveStudentPri](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/attendance.principal.service.js#90-123) loops through `records` and explicitly skips any without a `record_id`.
  - **Bug 2 (Transaction Loop Bottleneck)**: [saveStudentPri](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/attendance.principal.service.js#90-123) executes a separate `sequelize.transaction` for *every individual student* in a `for...of` loop. For a class of 60 students, this creates 60 separate database transactions sequentially. This is a massive performance bottleneck and should be a single bulk transaction.

### 5. Staff Attendance Correction ([features/staff/AttendanceCorrection.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/staff/AttendanceCorrection.tsx))
- **Frontend Request**:
  - Fetch students: `POST /attendance/correct-attendance/fetch-students` Payload: `{ year, batch_id, batch_type, slot_id, subject_id, date }`
  - Submit correction: `POST /attendance/correct-attendance` Payload: `{ records, slot_id, subject_id, date }`
- **Backend Response**: Returns list of records. Success payload contains updated records.
- **UI Representation**: Six-step filter resulting in a table. Uses the same frontend countdown timer (`secondsLeft`) as Take Attendance. 
- **Identified Issues / Potential Bugs**:
  - **Bug 1 (Unrecorded Students Masked)**: [fetchStaffCorrectionStudents](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/attendance.staff.service.js#108-161) explicitly queries `where: { is_locked: false }` against existing records. Thus, if Staff completely missed taking attendance during the initial 20-min window, they cannot "correct" it later because the UI will fetch 0 students. 
  - **Bug 2 (No Date Horizon Limit)**: The route does not restrict *how far back* staff can correct attendance. [correctStaffSubmit](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/attendance.staff.service.js#162-214) blocks *future* dates, but a staff member could technically correct an attendance record from 6 months ago without an override flag.
  - **Bug 3 (Timer Bypass)**: Similar to initial [TakeAttendance](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/staff/TakeAttendance.tsx#20-218), the submission window timer is entirely frontend-driven and can be trivially bypassed.

### 6. View Attendance ([features/yc/AttendanceView.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/yc/AttendanceView.tsx) & [features/principal/AttendanceView.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/principal/AttendanceView.tsx))
- **Frontend Request**: `GET /attendance/view` Payload: `{ year, date_from, date_to }`.
- **Backend Response**: Returns raw array of [AttendanceRecord](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/shared/StudentDetailsDialog.tsx#8-18) mixed with joined models.
- **UI Representation**: Single date picker filtering records. Displays a 2D matrix mapping 5 periods (P1 to P5) across the columns and student roll numbers down the rows. 
- **Identified Issues / Potential Bugs**:
  - **Bug 1 (Unpaginated Hard Limit)**: The backend [attendance.view.service.js](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Back/src/services/attendance.view.service.js) limits queries to `2000` records without implementing cursor/offset pagination. For a whole college over a few days, 2000 is easily exceeded, leading to silently dropped records in the view.
  - **Bug 2 (Slot Number Fragility)**: The API mapper in frontend maps array elements dynamically to `period${slotNum}` keys. If `TimetableSlot.slot_number` drops or is misconfigured, the columns fail to render because the UI Table explicitly expects exactly `period1` through `period5`.

### 7. Staff Monthly Register ([features/staff/MonthlyRegister.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/staff/MonthlyRegister.tsx))
- **Frontend Request**:
  - Fetch Subjects: `GET /monthly-register/subjects`
  - Fetch Register: `GET /monthly-register?subject_id=&month=YYYY-MM`
- **Backend Response**: Returns structured JSON with subject details, list of integer `days` with records, and a structured array of students mapping days to their dominant status (P/A/OD/IL).
- **UI Representation**: A dynamic table with Roll No, Name, daily status mapped per calendar day, and summary stats (Total Present, Absent, Percentage).
- **Identified Issues / Potential Bugs**:
  - **Bug 1 (Implicit Filter on Complete Absentees)**: The backend uses a SQL `JOIN` starting from `attendance_records` to `students`. This means if a student is officially assigned to the class but *has never had an attendance record logged for them in that specific month* (e.g. staff skipped them entirely, or they were enrolled mid-month but staff forgot), they will not appear as a row in the register at all, rather than appearing with blanks / absences.
  - **Bug 2 (SQL Dialect Lock-in)**: The raw query uses `DAY(ar.date)`. This is explicitly a MySQL function. If the database is ever swappped to SQLite (common in local testing frameworks) or Postgres, this query will catastrophically fail. 

### 8. YC OD/IL Entry ([features/yc/ODLeaveEntry.tsx](file:///home/darkemperor/aathi/donweb/DonboscoAWEB/Front/src/features/yc/ODLeaveEntry.tsx)) (Recently Refactored)
- **Frontend Request**: 
  - Fetch: `GET /attendance/od-il/students?date=YYYY-MM-DD` 
  - Submit: `POST /attendance/od-il/bulk` Payload: `{ date, records: [{ student_id, periods: { "1": { status, od_reason }, ... } }] }`
- **Backend Response**: Returns list of students with per-period nested OD/IL locks for the selected date.
- **UI Representation**: Date-first selection locking out past dates. A table displaying 5 explicit period columns (P1-P5) per student with dropdowns and "Set All" shortcuts.
- **Identified Issues / Potential Bugs (Pre-Fix)**:
  - *Note: These bugs were previously identified and formed the basis for the recent UI/Backend overhaul.*
  - **Historical Bug 1 (Slot Data Loss)**: The legacy frontend assigned `slot_id=0` dynamically on submit, destroying the link to `TimetableSlot`.
  - **Historical Bug 2 (Blanket Locking)**: The legacy system assumed OD was full-day. Thus, setting OD locked the student entirely, preventing granular period-wise corrections by staff.
  - **Historical Bug 3 (Empty Arrays on Fetch)**: The legacy `GET` request returned `[]` if no previous OD records existed for a day, meaning YCs could not see the actual list of students to grant OD to for future dates.

---
