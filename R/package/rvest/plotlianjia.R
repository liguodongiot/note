load('F:/R/liangjia/lianjia.rdata')
library(reshape2)
city_data=rev(melt(data,id=c('楼盘名','面积', '价格', '地址', '类型', '状态')))
city_data$地址 = as.vector(city_data$地址)
city_data$价格 = as.numeric(as.vector(city_data$价格))
city_data$面积 = as.vector(city_data$面积)
city_data$L1 = as.factor(city_data$L1)
city_data$楼盘名 = as.vector(city_data$楼盘名)
str(city_data)

city_data1 = city_data[which(city_data$价格 >= 3000),]

library(plyr)
city_price=ddply(city_data1,'L1',summarize, mean=mean(价格))
city_price$name = c('北京','成都','重庆','长沙','大连','广州','杭州','济南',
                    '南京','青岛','上海','石家庄','深圳','天津','武汉','西安',
                    '烟台')
city_priceorder = city_price[order(city_price$mean,decreasing = TRUE),]

#面积图
library(ggplot2)
ggplot(city_priceorder,aes(x=1:17,y=mean))+geom_point(shape=21,colour='red')+
  geom_line(colour='red')+geom_area(fill='red',alpha=0.5)+
  scale_x_continuous(breaks = seq(1:17),labels = city_priceorder$name )+
  theme_minimal()+
  scale_y_continuous(breaks = round(seq(min( city_priceorder$mean),
                                  max( city_priceorder$mean),length=10),1),
                     labels =  as.character(round(seq(min( city_priceorder$mean),
                                   max( city_priceorder$mean),length=10)),1) )+
  labs(x='城市',y='房价')

#条形图
ggplot(city_priceorder,aes(name,mean))+geom_col(fill='skyblue')+
  labs(x='城市',y='房价')

#层次聚类
hc <- hclust( dist(city_priceorder$mean))
plot(hc, hang = -1,labels = city_priceorder$name,xlab = '城市',
     ylab = '房价')

#房子在哪里
library(REmap)
library("baidumap")


coord = get_geo_position(as.vector(city_data$地址))

remapB(markPointData = data.frame(coord$city),
       markPointTheme = markPointControl(symbol = "pin",
                                         effect=F,
                                         symbolSize = 5,
                                         color="red"),
       geoData = coord)



