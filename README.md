# User Behavior Analysis

## Overview
big data: efficency, index


### Data Source User Behavior Data from Taobao
https://tianchi.aliyun.com/dataset/dataDetail?dataId=649&userId=1

### Data Overview 
table: user_behavior<br>
columns: user_id, item_id, category_id int, behavior_type varchar, timestamp<br>
Info:
user_id int 987,994 <br>
item_id int 4,162,024<br>
category_id 9,439<br>
behavior_type 4 types: pv - pageview/click, fav - favorite, cart - category, buy - buy<br>
timestamp: yyyy-mm-dd<br>

## 1 Business Analysis
define why: connect business with data<br> 
gathering reuiqrements: from product(product centerted) or operation(user centerted) deparment<br> 
Product, User, Platform <br> 

## 2 Data Collection 
Data Integration ETL extract, transform and load<br>
Kettle is a leading open source ETL application<br>

## 2 Data Cleaninging 
name: type, constrain 
value: null, repeated, anomoly 

## 2 Data Analysis 
User(focus), Goods, Platform: how to act: functions improvement, recomendation system 

## 2 Data Visualization 
Tableau 

## 2 Interpretation 


## 3 Modeling 

Recomendation System 

## 3 Interpretation: Explianable AI 

Shap value to explain the model 
