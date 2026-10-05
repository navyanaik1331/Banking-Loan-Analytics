CREATE DATABASE BANK_LOAN_APPROVAL;
USE BANK_LOAN_APPROVAL;
SELECT * FROM LoanData;
SELECT COUNT(*) FROM LoanData;
DESC LoanData;

SELECT *
FROM LoanData
LIMIT 10;

SELECT 
    loan_status,
    COUNT(*) AS application_count
FROM LoanData
GROUP BY loan_status;

-- 1. Total Loan Applications
SELECT COUNT(*) AS 'Total_Loan_Application'
FROM LoanData;  

-- 2. Approved vs Rejected Applications
SELECT loan_status, COUNT(*) AS 'Application_Count'
FROM LoanData 
GROUP BY loan_status;

-- 3.  Overall Approval Rate
SELECT 
    ROUND(
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*), 
        2
    ) AS approval_rate
FROM LoanData;

-- 4. Overall Rejection Rate
 SELECT 
    ROUND(
        SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) 
        * 100.0 / COUNT(*), 
        2
    ) AS rejection_rate
FROM LoanData;

-- 5. Total & Average Loan Amount
SELECT 
    SUM(loan_amount) AS total_loan_amount,
    ROUND(AVG(loan_amount),2) AS average_loan_amount
FROM LoanData;

-- 6. Average Applicant Income & CIBIL Score
SELECT 
    ROUND(AVG(income_annum), 2) AS average_income,
    ROUND(AVG(cibil_score), 2) AS average_cibil_score
FROM LoanData; 

-- 7. Applications by Education
SELECT
    education,
    COUNT(*) AS application_count
FROM LoanData
GROUP BY education;

-- 8. Approval Rate by Education
SELECT
    education,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS approval_rate
FROM LoanData
GROUP BY education;

-- 9. Approval Rate by Self-Employment
SELECT
    self_employed,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS approval_rate
FROM LoanData
GROUP BY self_employed;

-- 10. Approval Rate by Income Group
SELECT
    income_group,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS approval_rate
FROM LoanData
GROUP BY income_group
ORDER BY approval_rate DESC;

-- 11. Approval Rate by CIBIL Category
SELECT
    cibil_category,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS approval_rate
FROM LoanData
GROUP BY cibil_category
ORDER BY approval_rate DESC;

-- 12 — Loan Applications by Number of Dependents
SELECT
    no_of_dependents,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected
FROM LoanData
GROUP BY no_of_dependents
ORDER BY no_of_dependents;

-- 13 — Income Groups with More Than 500 Applications
SELECT
    income_group,
    COUNT(*) AS application_count
FROM LoanData
GROUP BY income_group
HAVING COUNT(*) > 500;

-- 14 — CIBIL Categories with More Than 500 Applications
SELECT
    cibil_category,
    COUNT(*) AS application_count
FROM LoanData
GROUP BY cibil_category
HAVING COUNT(*) > 500;

-- 15 — Income Groups with Average Loan > Overall Average
SELECT
    income_group,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM LoanData
GROUP BY income_group
HAVING AVG(loan_amount) > (
    SELECT AVG(loan_amount)
    FROM LoanData
)
ORDER BY average_loan_amount DESC;

-- 16 — Applicants Above Average Income
SELECT
    loan_id,
    income_annum,
    loan_amount,
    cibil_score,
    loan_status
FROM LoanData
WHERE income_annum > (
    SELECT AVG(income_annum)
    FROM LoanData
)
ORDER BY income_annum DESC;

-- 17 — Loans Above Average Loan Amount
SELECT
    loan_id,
    income_annum,
    loan_amount,
    cibil_score,
    loan_status
FROM LoanData
WHERE loan_amount > (
    SELECT AVG(loan_amount)
    FROM LoanData
)
ORDER BY loan_amount DESC;

-- 18 — Highest Loan Amount
SELECT *
FROM LoanData
WHERE loan_amount = (
    SELECT MAX(loan_amount)
    FROM LoanData
);

-- 19 — Approved vs Rejected Loan Amount Summary
SELECT
    a.loan_status,
    a.application_count,
    a.total_loan_amount
FROM
(
    SELECT
        loan_status,
        COUNT(*) AS application_count,
        SUM(loan_amount) AS total_loan_amount
    FROM LoanData
    GROUP BY loan_status
) a;

-- 20 — Compare Approved and Rejected Applications
SELECT
    approved.application_count AS approved_applications,
    rejected.application_count AS rejected_applications,
    approved.total_loan_amount AS approved_loan_amount,
    rejected.total_loan_amount AS rejected_loan_amount
FROM
(
    SELECT
        COUNT(*) AS application_count,
        SUM(loan_amount) AS total_loan_amount
    FROM LoanData
    WHERE loan_status = 'Approved'
) approved
CROSS JOIN
(
    SELECT
        COUNT(*) AS application_count,
        SUM(loan_amount) AS total_loan_amount
    FROM LoanData
    WHERE loan_status = 'Rejected'
) rejected;

-- 21 — Education-wise Approved vs Rejected
SELECT
    e.education,
    e.approved_count,
    r.rejected_count
FROM
(
    SELECT
        education,
        COUNT(*) AS approved_count
    FROM LoanData
    WHERE loan_status = 'Approved'
    GROUP BY education
) e
JOIN
(
    SELECT
        education,
        COUNT(*) AS rejected_count
    FROM LoanData
    WHERE loan_status = 'Rejected'
    GROUP BY education
) r
ON e.education = r.education;

-- 22 — CTE for Approval Rate
WITH loan_summary AS (
    SELECT
        loan_status,
        COUNT(*) AS application_count
    FROM LoanData
    GROUP BY loan_status
)
SELECT
    loan_status,
    application_count,
    ROUND(
        application_count * 100.0 /
        (SELECT SUM(application_count) FROM loan_summary),
        2
    ) AS percentage_of_applications
FROM loan_summary;

-- 23 — CTE for CIBIL Approval Analysis
WITH cibil_summary AS (
    SELECT
        cibil_category,
        COUNT(*) AS total_applications,
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved
    FROM LoanData
    GROUP BY cibil_category
)
SELECT
    cibil_category,
    total_applications,
    approved,
    ROUND(approved * 100.0 / total_applications, 2) AS approval_rate
FROM cibil_summary
ORDER BY approval_rate DESC;

-- 24 — CTE for Income Group Loan Analysis
WITH income_summary AS (
    SELECT
        income_group,
        COUNT(*) AS applications,
        AVG(loan_amount) AS avg_loan_amount,
        AVG(loan_to_income_ratio) AS avg_lti_ratio
    FROM LoanData
    GROUP BY income_group
)
SELECT
    income_group,
    applications,
    ROUND(avg_loan_amount, 2) AS avg_loan_amount,
    ROUND(avg_lti_ratio, 2) AS avg_lti_ratio
FROM income_summary
ORDER BY avg_loan_amount DESC;

-- 25 — CTE to Find High Loan-to-Income Applicants
WITH loan_exposure AS (
    SELECT
        loan_id,
        income_annum,
        loan_amount,
        loan_to_income_ratio,
        loan_status
    FROM LoanData
)
SELECT *
FROM loan_exposure
WHERE loan_to_income_ratio > 5
ORDER BY loan_to_income_ratio DESC;

-- 26. Rank applicants by loan amount.
SELECT
    loan_id,
    loan_amount,
    income_annum,
    loan_status,
    ROW_NUMBER() OVER (
        ORDER BY loan_amount DESC
    ) AS loan_rank
FROM LoanData;

-- 27 — RANK()
SELECT
    loan_id,
    loan_amount,
    RANK() OVER (
        ORDER BY loan_amount DESC
    ) AS loan_rank
FROM LoanData;

-- 28 — DENSE_RANK()
SELECT
    loan_id,
    loan_amount,
    DENSE_RANK() OVER (
        ORDER BY loan_amount DESC
    ) AS loan_rank
FROM LoanData;

-- 29 — Rank Applicants Within Loan Status
SELECT
    loan_id,
    loan_status,
    loan_amount,
    RANK() OVER (
        PARTITION BY loan_status
        ORDER BY loan_amount DESC
    ) AS status_wise_rank
FROM LoanData;

-- 30 — Top 5 Loan Applications Within Each Status
WITH ranked_loans AS (
    SELECT
        loan_id,
        loan_status,
        loan_amount,
        RANK() OVER (
            PARTITION BY loan_status
            ORDER BY loan_amount DESC
        ) AS loan_rank
    FROM LoanData
)
SELECT *
FROM ranked_loans
WHERE loan_rank <= 5;

-- 31. Compare each applicant's loan amount with the previous row.
SELECT
    loan_id,
    loan_amount,
    LAG(loan_amount) OVER (
        ORDER BY loan_id
    ) AS previous_loan_amount
FROM LoanData;

-- 32 — LEAD()
SELECT
    loan_id,
    loan_amount,
    LEAD(loan_amount) OVER (
        ORDER BY loan_id
    ) AS next_loan_amount
FROM LoanData;

-- 33 — Difference from Previous Loan
SELECT
    loan_id,
    loan_amount,
    LAG(loan_amount) OVER (
        ORDER BY loan_id
    ) AS previous_loan_amount,
    loan_amount -
    LAG(loan_amount) OVER (
        ORDER BY loan_id
    ) AS difference_from_previous
FROM LoanData;

-- 34 — Create Loan Approval Summary View
CREATE VIEW Loan_Approval_Summary AS
SELECT
    loan_status,
    COUNT(*) AS application_count,
    SUM(loan_amount) AS total_loan_amount,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount,
    ROUND(AVG(income_annum), 2) AS average_income,
    ROUND(AVG(cibil_score), 2) AS average_cibil_score
FROM LoanData
GROUP BY loan_status;

SELECT *
FROM Loan_Approval_Summary;

-- 35 — Create CIBIL Analysis View
CREATE VIEW CIBIL_Analysis AS
SELECT
    cibil_category,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS approval_rate
FROM LoanData
GROUP BY cibil_category;

SELECT *
FROM CIBIL_Analysis
ORDER BY approval_rate DESC;

-- 36 — Stored Procedure for Loan Status Summary
DELIMITER //

CREATE PROCEDURE GetLoanStatusSummary()
BEGIN
    SELECT
        loan_status,
        COUNT(*) AS application_count,
        SUM(loan_amount) AS total_loan_amount,
        ROUND(AVG(loan_amount), 2) AS average_loan_amount
    FROM LoanData
    GROUP BY loan_status;
END //

DELIMITER ;

CALL GetLoanStatusSummary();

-- 37 — Stored Procedure for CIBIL Category
DELIMITER //

CREATE PROCEDURE GetCIBILAnalysis()
BEGIN
    SELECT
        cibil_category,
        COUNT(*) AS total_applications,
        SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) AS approved,
        SUM(CASE WHEN loan_status = 'Rejected' THEN 1 ELSE 0 END) AS rejected,
        ROUND(
            SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(*),
            2
        ) AS approval_rate
    FROM LoanData
    GROUP BY cibil_category
    ORDER BY approval_rate DESC;
END //

DELIMITER ;

CALL GetCIBILAnalysis();

-- 38 — Parameterized Stored Procedure 
DELIMITER //

CREATE PROCEDURE GetLoansByStatus(IN status_input VARCHAR(20))
BEGIN
    SELECT
        loan_id,
        income_annum,
        loan_amount,
        cibil_score,
        loan_status
    FROM LoanData
    WHERE loan_status = status_input
    ORDER BY loan_amount DESC;
END //

DELIMITER ;

CALL GetLoansByStatus('Approved');

CALL GetLoansByStatus('Rejected');
 

-- ==========================================
-- BUSINESS INSIGHTS
-- ==========================================

-- 1. Overall Approval
-- 62.22% of applications were approved.

-- 2. CIBIL
-- Poor CIBIL applicants had a 10.36% approval rate,
-- while Fair, Good and Excellent categories had ~99% approval.

-- 3. Education
-- Graduate and Not Graduate applicants had similar
-- approval rates: 62.45% and 61.98%.

-- 4. Employment
-- Self-employed and non-self-employed applicants had
-- nearly identical approval rates: 62.23% and 62.20%.

-- 5. Loan Amount
-- Average approved loan amount was approximately ₹15.25M,
-- compared with ₹14.95M for rejected applications.
 

