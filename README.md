# ☄️ NASA Meteorite Landings Power Bi Dashboard

This Power BI project visualizes meteorite landing data collected by NASA, enabling interactive exploration of global distributions, mass classifications, temporal trends, and more. The report is designed to support both high-level overviews and detailed analysis of meteor characteristics and patterns.

---

## Project Overview

This dashboard utilizes a dataset of meteorite landings publicly available from NASA, offering insights into:

- Total meteorite impact counts
- Mass ranges (Small / Medium / Large)
- Temporal patterns over years and decades
- Hemispherical and geospatial distribution
- Scientific classifications (`recclass`)
- Identification of the largest meteorites on record

---

## Dashboard Structure

The report is divided into **2 main pages**, with an optional **Start Page** for navigation:

### 📄 **Start Page (Navigation Menu)**
- Project introduction and purpose
- Summary of available pages
- Navigation buttons to each dashboard section

---

### 📄 **Page 1 – Overview**
Explore large-scale patterns in meteorite landings.

**Visualizations:**
- KPI Cards: Total Meteor Count, Average Mass, Largest Meteor
- Hemisphere breakdown
- World map of meteorite locations
- Pie chart of mass categories (Small, Medium, Large)
- Line chart of yearly landing trends and total mass

---

### 📄 **Page 2 – Mass & Classification Details**
Dive into the physical and scientific attributes of meteors.

**Visualizations:**
- Top 10 meteorites by mass (table & map)
- Treemap of meteorite classifications (`recclass`)
- Location-based map with marker size by mass

---

## Data Source

- **Source:** [NASA Open Data Portal](https://data.nasa.gov/)
- **Dataset:** Meteorite Landings
- **Fields Used:**  
  - `name`, `mass (g)`, `year`, `fall`, `reclat`, `reclong`, `recclass`, `GeoLocation`

---

## DAX Highlights

Custom calculated columns and measures were created to enrich the analysis:

- `MassCategory`: Categorizes meteorites as Small, Medium, or Large based on tonnage.
- `EnYogunYarimkure`: Classifies hemisphere based on latitude.
- `Decade`: Converts year into decade bins for temporal grouping.
- `FixedLat`, `FixedLong`: Ensures numeric conversion of coordinates for mapping.
- `TotalMass`, `AverageMass`, `LargestMass`: Aggregated metrics for visuals and KPIs.

---

## Navigation

The dashboard includes navigation buttons allowing users to move between pages. Each page has a short description, allowing even non-technical users to understand the purpose and interact with the visuals effectively.

---

## 📷 Preview

| Start Page | Overview Page | Mass & Class Page |
|------------|----------------|--------------------|
| ![](./Screenshots/StartPage.png) | ![](./Screenshots/Page1_Overview.png) | ![](./Screenshots/Page2_MassClass.png) |

---

## 📁 File Structure


