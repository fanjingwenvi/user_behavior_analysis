# User Behavior Analysis

## Overview

Business Backgroud <br>
Taobao is a Chinese online shopping platform. It is headquartered in Hangzhou and is owned by Alibaba. According to Alexa rank, it is the eighth most-visited website globally in 2021.(source:wikipedia)<br>
<br>
Dataset: User_Behavior <br>
The dataset of this project contains all the behaviors of about 1 million random users with behaviors (behaviors including pageview, favorite, cart, buy ) between  2017-11-25 to 2017-12-3 on the Taobao platform. Each row of the dataset represents a user behavior, which consists of user_id, item_id, category_id, behavior_type, timestamp.  
https://tianchi.aliyun.com/dataset/dataDetail?dataId=649&userId=1<br>
<br>
Dataset Size 
index: 100,150,807<br>
user_id: 987,994 <br>
item_id: 4,162,024<br>
category_id: 9,439<br>

## 1.Business Analysis

Goal for the platform app: 1. Incresing profit/sales 2.Improving the amount of buyer and seller <br>
How: Ceate KPIs and compare to the base line, find hidden information from buyer user, to support operation and product stragy making.<br> 
(real scenario: gathering reuiqrements: from operation deparment - user centerted, or product deparment - product centerted) <br>

![mindnode](img/Analysis_Mindmap.jpg)

User Conversion: improve conversion rate <br>
User Habit: target active users <br>
User Value: different strategies for different users <br>
User Preference: include the seller users <br>

## 2.Data Collection 
There are different approaches. 
Data Form: CSV File - SQL Database - pandas DataFram - Spark DataFrame<br>
Related Field: Data Integration: ETL extract, transform and load.Big Data: batach processing, configuration.<br>

## 3. Data Cleaninging 
field/column: datatype, constrain<br> 
value: null, repeated, anomoly<br> 

## 4. Data Analysis 
See SQL Folder  

## 5. Data Visualization and Interpretation 
See Tableau<br> 

## 6.Further Development 
Replacing sql with pandas or pyspark https://www.kaggle.com/code/fanjingwen/user-behavior-analysis/edit/run/99646720<br>
ML Modeling: Recomendation System <br>
ML Visualizationa and Interpretation: shap value for explainable AI <br>
