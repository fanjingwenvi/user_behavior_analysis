# User Behavior Analysis

## 0.Overview

My Kaggale Notebook 
https://www.kaggle.com/code/fanjingwen/user-behavior-analysis/edit/run/99646720<br>

### Business Backgroud 
Taobao is a Chinese online shopping platform. It is headquartered in Hangzhou and is owned by Alibaba. According to Alexa rank, it is the eighth most-visited website globally in 2021.(source:wikipedia)<br>

### Data Source 
User Behavior Data from Taobao<br>
https://tianchi.aliyun.com/dataset/dataDetail?dataId=649&userId=1<br>

### Data Overview 
table: user_behavior<br>
columns: user_id, item_id, category_id int, behavior_type varchar, timestamp<br>
Info:
index 100,150,807<br>
user_id INT 987,994 <br>
item_id INT 4,162,024<br>
category_id INT 9,439<br>
behavior_type CHAR 4 types: pv - pageview/click, fav - favorite, cart - category, buy - buy<br>
timestamp INT yyyy-mm-dd hh:mm:ss  2017-11-25 to 2017-12-3<br>

## 1.Business Analysis
define why: connect business with data<br> or gathering reuiqrements: from operation deparment(user centerted) or product deparment(product centerted)<br> 
<br>
Perspectives: User, Product(Vendor User), Platform(product) <br> 
Comments: Users include consumers and verdors. Sales and growing the network are both important <br>
<br>
Create KPIs: compare to the base line<br>
How active is the use? - behavior / behavior distict user id<br>
What is the avarage conversion rate? - behavior types ratio<br> 
How user bahve in diffrent time series? - day and hour, buy<br> 
Distribution of the sales - 80% sales and 20% products<br>

## 2.Data Collection 
CSV - Table - DataFrame / Spark DataFrame<br>
Big Data: Spark, Pyspark<br>
Data Integration: ETL extract, transform and load. Kettle is a leading open source ETL application <br>

## 3. Data Cleaninging 
field/column: datatype, constrain<br> 
value: null, repeated, anomoly<br> 
(time datatype and time series)<br> 

## 4. Data Analysis 
User, Product(Vender user), Platform<br> 

## 5. Data Visualization and Interpretation 
Tableau<br> 
how to add business value to the system<br>
user contric and produc centric<br> 
improvement: waht if the coversion rate is low? Maybe a recomendation system in the furture? <br>

## 6.Further Development 
Modeling: Recomendation System 
Visualizationa and Interpretation: Shap value for explainable AI 
