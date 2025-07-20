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

## Dashboard Preview

| Start Page | Overview Page | Mass & Class Page |
|------------|----------------|--------------------|
| ![Start](./Dashboard%20Pages/Start_Page.png) | ![Overview](./Dashboard%20Pages/Overview.png) | ![Mass & Class](./Dashboard%20Pages/Mass_and_Class_Analysis.png) |

---

## Dashboard Structure

The report is divided into **2 main pages**, with an optional **Start Page** for navigation:

### 📄 **Start Page (Navigation Menu)**
- Project introduction and purpose
- Summary of available pages
- Navigation buttons to each dashboard section


### 📄 **Page 1 – Overview**
Explore large-scale patterns in meteorite landings.

**Visualizations:**
- KPI Cards: Total Meteor Count, Average Mass, Largest Meteor
- Hemisphere breakdown
- World map of meteorite locations
- Pie chart of mass categories (Small, Medium, Large)
- Line chart of yearly landing trends and total mass


### 📄 **Page 2 – Mass & Classification Details**
Dive into the physical and scientific attributes of meteors.

**Visualizations:**
- Top meteorites by mass (table & map)
- Treemap of meteorite classifications (`recclass`)
- Location-based map of Top 10 largest meteorites

---



## Data Source

- **Source:** [NASA Open Data Portal](https://data.nasa.gov/)
- **Dataset:** Meteorite Landings
- **Fields Used:**  
  - `name`, `mass (g)`, `year`, `fall`, `reclat`, `reclong`, `recclass`, `GeoLocation`

---

## DAX Highlights

Custom calculated columns and measures were created to enrich the analysis:

| **Table**        | **DAX Column**         | **Description**                                                                 |
|------------------|------------------------|----------------------------------------------------------------------------------|
| `MassTable`      | `mass_ton`             | Converts mass from grams to tons for consistent scaling.                        |
| `MassTable`      | `MassCategory`         | Categorizes each meteorite as "Small", "Medium", or "Large" by tonnage.         |
| `LocationTable`  | `FixedLat`             | Parses latitude (`reclat`) into numeric format for accurate mapping.            |
| `LocationTable`  | `FixedLong`            | Parses longitude (`reclong`) into numeric format for accurate mapping.          |
| `LocationTable`  | `MostLandingsHemisphere`     | Identifies the dominant hemisphere based on landing distribution.               |
| `LocationTable`  | `Hemisphere`           | Classifies each record as "Northern" or "Southern" based on latitude.           |
| `TimeTable`      | `Decade`               | Groups meteorite years into decades for clearer timeline visualizations.        |


---


## 📁 File Structure

NASA-Meteorite-Landings-Power-Bi-Dashboard  
├── 📁 Dashboard Pages  
│    ├── Start_Page.png  
│    ├── Overview.png  
│    └── Mass_and_Class_Analysis.png  
├── 📁 MSSQL Data Cleaning  
│    └── Data_Cleaning_Nasa_Meteorite.sql   
├── 📁 PowerBi  
│    └── Final_Project_PowerBi_Nasa_Meteorite.pbix  
└── README.md  
