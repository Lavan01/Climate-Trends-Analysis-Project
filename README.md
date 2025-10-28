# 🌦️ Weather Data Visualization using Logistic Regression (R Project)

## 📘 Project Overview
This project focuses on analyzing and visualizing weather data using **R programming**.  
A **Logistic Regression model** is implemented to predict the probability of rainfall based on various weather parameters such as **temperature**, **humidity**, and **wind speed**.  
The project also includes data cleaning, visualization, and model evaluation steps.

---

## 🧠 Objectives
- To analyze historical weather data and identify key patterns.  
- To apply **Logistic Regression** for predicting rainfall occurrence.  
- To visualize weather parameters for better understanding and insights.  
- To evaluate model performance using metrics like accuracy and confusion matrix.

---

## ⚙️ Technologies Used
- **Programming Language:** R  
- **Environment:** RStudio  
- **Libraries:**  
  - `tidyverse`  
  - `ggplot2`  
  - `caTools`  
  - `caret`  

---

## 📂 Dataset
- **File Name:** `weather.csv`  
- The dataset includes features such as:  
  - Formatted Date  
  - Temperature (°C)  
  - Humidity  
  - Wind Speed (Km/h)  
  - Pressure  
  - Visibility  
  - Precipitation Type (Rain/Snow)

> Place the `weather.csv` file in the **same directory** as your R script before running the project.

---

## 🚀 Implementation Steps
1. **Load Libraries**  
   ```r
   library(tidyverse)
   library(caTools)
   library(caret)
