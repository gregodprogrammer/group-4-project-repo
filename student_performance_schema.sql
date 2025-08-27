-- Student Performance Star/Relational Schema (PostgreSQL)
-- Generated on 2025-08-25 11:31:17 UTC

CREATE TABLE IF NOT EXISTS students (
    student_id VARCHAR(64) PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    gender TEXT,
    preferred_learning_style TEXT
);

CREATE TABLE IF NOT EXISTS courses (
    course_id VARCHAR(64) PRIMARY KEY,
    course_name TEXT NOT NULL,
    term TEXT,
    credits INT DEFAULT 3
);

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id VARCHAR(64) REFERENCES students(student_id),
    course_id VARCHAR(64) REFERENCES courses(course_id)
);

CREATE TABLE IF NOT EXISTS performance (
    perf_id SERIAL PRIMARY KEY,
    student_id VARCHAR(64) REFERENCES students(student_id),
    course_id VARCHAR(64) REFERENCES courses(course_id),
    study_hours_per_week NUMERIC,
    online_courses_completed INT,
    participation_in_discussions INT,
    assignment_completion_rate NUMERIC, -- already weighted to 30%
    exam_score NUMERIC,                  -- already weighted to 70%
    mastery_score NUMERIC,               -- sum of weighted components (0-100)
    final_grade TEXT,
    gpa NUMERIC
);

CREATE TABLE IF NOT EXISTS attendance (
    attendance_id SERIAL PRIMARY KEY,
    student_id VARCHAR(64) REFERENCES students(student_id),
    course_id VARCHAR(64) REFERENCES courses(course_id),
    attendance_rate NUMERIC -- 0-100
);

CREATE TABLE IF NOT EXISTS activity_log (
    activity_id SERIAL PRIMARY KEY,
    student_id VARCHAR(64) REFERENCES students(student_id),
    course_id VARCHAR(64) REFERENCES courses(course_id),
    use_of_educational_tech TEXT,
    self_reported_stress_level INT,
    time_spent_on_social_media NUMERIC,
    sleep_hours_per_night NUMERIC,
    event_ts TIMESTAMP DEFAULT now()
);