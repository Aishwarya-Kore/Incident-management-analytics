-- 1. Create table
CREATE TABLE incident_event_log (
    number VARCHAR(50),
    incident_state VARCHAR(50),
    active BOOLEAN,
    reassignment_count INT,
    reopen_count INT,
    sys_mod_count INT,
    made_sla BOOLEAN,
    caller_id VARCHAR(100),
    opened_by VARCHAR(100),
    opened_at TIMESTAMP,
    sys_created_by VARCHAR(100),
    sys_created_at TIMESTAMP,
    sys_updated_by VARCHAR(100),
    sys_updated_at TIMESTAMP,
    contact_type VARCHAR(100),
    location VARCHAR(150),
    category VARCHAR(100),
    subcategory VARCHAR(100),
    u_symptom VARCHAR(255),
    cmdb_ci VARCHAR(100),
    impact VARCHAR(50),
    urgency VARCHAR(50),
    priority VARCHAR(50),
    assignment_group VARCHAR(150),
    assigned_to VARCHAR(150),
    knowledge VARCHAR(50),
    u_priority_confirmation VARCHAR(50),
    notify VARCHAR(50),
    problem_id VARCHAR(100),
    rfc VARCHAR(100),
    vendor VARCHAR(150),
    caused_by VARCHAR(100),
    closed_code VARCHAR(100),
    resolved_by VARCHAR(100),
    resolved_at TIMESTAMP,
    closed_at TIMESTAMP,
    resolution_hours DECIMAL(10,2),
    closure_hours DECIMAL(10,2),
    resolution_days DECIMAL(10,2),
    opened_year INT,
    month_name VARCHAR(20),
    reassignment_band VARCHAR(50),
    sla_status VARCHAR(50)
);

-- 2. Incident Volume by Priority
SELECT
    priority,
    COUNT(DISTINCT number) AS total_incidents
FROM incident_event_log
GROUP BY priority
ORDER BY total_incidents DESC;

-- 3. SLA Performance
SELECT
    sla_status,
    COUNT(DISTINCT number) AS total_incidents
FROM incident_event_log
GROUP BY sla_status
ORDER BY total_incidents DESC;

-- 4. Monthly Incident Trend
SELECT
    opened_year,
    month_name,
    COUNT(DISTINCT number) AS total_incidents
FROM incident_event_log
GROUP BY opened_year, month_name
ORDER BY opened_year, MIN(opened_at);

-- 5. Incident Volume by Category
SELECT
    category,
    COUNT(DISTINCT number) AS total_incidents
FROM incident_event_log
GROUP BY category
ORDER BY total_incidents DESC;

-- 6. Assignment Group Workload
SELECT
    assignment_group,
    COUNT(DISTINCT number) AS total_incidents
FROM incident_event_log
GROUP BY assignment_group
ORDER BY total_incidents DESC;

-- 7. Average Resolution Time by Priority
SELECT
    priority,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM incident_event_log
WHERE resolution_hours IS NOT NULL
GROUP BY priority
ORDER BY avg_resolution_hours DESC;

-- 8. Reopened Incidents
WITH incident_level AS (
    SELECT
        number,
        MAX(reopen_count) AS reopen_count
    FROM incident_event_log
    GROUP BY number
)
SELECT
    CASE
        WHEN reopen_count > 0 THEN 'Reopened'
        ELSE 'Not Reopened'
    END AS reopen_status,
    COUNT(*) AS total_incidents
FROM incident_level
GROUP BY
    CASE
        WHEN reopen_count > 0 THEN 'Reopened'
        ELSE 'Not Reopened'
    END
ORDER BY total_incidents DESC;

-- 9. Reassignment Analysis
WITH incident_level AS (
    SELECT
        number,
        MAX(reassignment_count) AS reassignment_count
    FROM incident_event_log
    GROUP BY number
)
SELECT
    CASE
        WHEN reassignment_count = 0 THEN 'No Reassignment'
        WHEN reassignment_count BETWEEN 1 AND 2 THEN '1-2 Reassignments'
        WHEN reassignment_count BETWEEN 3 AND 5 THEN '3-5 Reassignments'
        ELSE 'More than 5'
    END AS reassignment_band,
    COUNT(*) AS total_incidents
FROM incident_level
GROUP BY
    CASE
        WHEN reassignment_count = 0 THEN 'No Reassignment'
        WHEN reassignment_count BETWEEN 1 AND 2 THEN '1-2 Reassignments'
        WHEN reassignment_count BETWEEN 3 AND 5 THEN '3-5 Reassignments'
        ELSE 'More than 5'
    END
ORDER BY total_incidents DESC;

-- 10. Rank Categories
WITH category_volume AS (
    SELECT
        category,
        COUNT(DISTINCT number) AS total_incidents
    FROM incident_event_log
    GROUP BY category
)
SELECT
    category,
    total_incidents,
    RANK() OVER (
        ORDER BY total_incidents DESC
    ) AS category_rank
FROM category_volume
ORDER BY category_rank;

-- 11. Priority vs Resolution Performance
SELECT
    priority,
    COUNT(DISTINCT number) AS total_incidents,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(resolution_days), 2) AS avg_resolution_days
FROM incident_event_log
WHERE resolution_hours IS NOT NULL
GROUP BY priority
ORDER BY total_incidents DESC;