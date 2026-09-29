# Incident-management-analytics
This project analyzes IT incident management data to understand incident volume, SLA performance, resolution time, priority, categories, assignment-group workload, and incident handling patterns.

## 🎯 Business Objective

The objective of this project is to help an IT operations team monitor incident performance and identify areas that may require operational attention.
The analysis focuses on:

* Incident volume and trends
* Priority-wise incident distribution
* SLA performance
* Resolution time
* Incident categories
* Assignment-group workload
* Reopened incidents
* Reassignment patterns

## 🗂️ Dataset & Data Grain

The dataset contains **141,712 event-level records** representing incident state changes.
There are **24,918 unique incidents**.
An incident can appear multiple times because its lifecycle may contain multiple events, such as:
**New → Assigned → In Progress → Resolved → Closed**
Therefore, incident-level KPIs use **distinct incident numbers** rather than simply counting rows.

## 🛠️ Tools & Technologies

| Tool            | Purpose                                            |
| --------------- | -------------------------------------------------- |
| Python / Pandas | Data cleaning, validation and exploratory analysis |
| PostgreSQL      | Data storage and SQL analysis                      |
| SQL             | KPI calculation and business analysis              |
| Excel           | PivotTable-based analysis                          |
| Power BI        | Interactive dashboard and visualization            |

## 🐍 Python Analysis
Python and Pandas were used for:
* Dataset inspection
* Data quality checks
* Missing-value handling
* Data-type conversion
* Duplicate validation
* Date transformation
* Resolution and closure time calculation
* Incident-level analysis
* Reopened incident analysis
* Exploratory analysis by priority, category and SLA status

## 🗄️ SQL Analysis

SQL was used to analyze:
* Incident volume by priority
* SLA performance
* Monthly incident trends
* Incident volume by category
* Assignment-group workload
* Average resolution time by priority
* Reopened incidents
* Reassignment patterns
* Category ranking
* Priority-wise resolution performance
  
## 📊 Excel Analysis
Excel was used for PivotTable-based analysis including:
* Incident volume by priority
* SLA performance
* Monthly incident trends
* Incident volume by category
* Assignment-group workload
* Average resolution time by priority
* Reopened incidents
* Priority vs. category analysis

## 📈 Power BI Dashboard
The Power BI dashboard provides an interactive view of incident management performance.
### Key KPIs

* Total Incidents
* SLA Compliance %
* SLA Met Incidents
* SLA Missed Incidents
* Average Resolution Hours
* Reopened Incidents

### Dashboard Analysis
The dashboard allows analysis of incidents by:

* Priority
* SLA status
* Category
* Assignment group
* Time period
* Reassignment pattern

## 💡 Business Value
This analysis provides a structured view of IT incident operations and can help teams investigate:

* Changes in incident volume
* SLA performance
* Resolution-time patterns
* High-volume incident categories
* Assignment-group workload
* Reopened incidents
* Reassignment patterns

The analysis can support further investigation into operational bottlenecks and service-management performance.

## 👩‍💻 Skills Demonstrated

**Data Analysis:** Python, Pandas, SQL, Excel, Power BI

**Database:** PostgreSQL

**Analytics:** Data Cleaning, Data Validation, KPI Development, Exploratory Data Analysis, Aggregation, Trend Analysis

**Power BI:** DAX, KPI Cards, Filters, Slicers, Charts, Interactive Dashboard

**SQL:** GROUP BY, CASE, CTEs, DISTINCT COUNT, Aggregate Functions, Window Functions
