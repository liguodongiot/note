
library(rvest)
#url0 <- 'http://bj.fang.lianjia.com/loupan/'
name=area=price=type=address=status=NULL
city=c('bj','cd','cs','cq','dl','xa')
dat = vector("list", length(city))
for(j in length(city)){
  for(i in 1:2)
  {
    url <- paste('http://',city[j],'.fang.lianjia.com/loupan/',"pg",i,sep = '')
    web <- read_html(url)
    name <- c(name,web %>% html_nodes('div.info-panel') %>% 
                html_nodes('a') %>% html_text())
    address <- c(address,web %>% html_nodes('div.info-panel') %>% 
                   html_nodes('div.where') %>% html_nodes('span.region') %>% 
                   html_text())
    b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
    are=rep(0,length(b))
    for (i in 1:length(b))
    {
      if (str_length(b[i]) > 60){
        are[i] =  b[i]%>% html_nodes('span') %>% html_text()
      }else{
        are[i] = 0
      }
    }
    area=c(area,ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+'))))
    a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
    price=rep(0,length(a))
    for (i in 1:length(a))
    {
      if (str_length(a[i]) > 100){
        price[i] = a[i]%>% html_nodes('span.num') %>% html_text()
      }else{
        price[i] = 0
      }
    }
    price=c(price,price)
    type <-c(type, web %>% html_nodes('div.info-panel') %>% 
               html_nodes('div.type') %>% html_nodes('span.live') %>% html_text())
    status <-c(status, web %>% html_nodes('div.info-panel') %>% 
                 html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text())
    dat[[j]] <- data.frame(name,address,area,price=price,type,status)
    
    }
  
  dat[[j]] <- data.frame(name,address,area,price=price,type,status)
  
}


######################################################################







library(DT)
library(rvest)
library(stringr)

#beijing
url0 <- 'http://bj.fang.lianjia.com/loupan/'
data_bj=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:4)
{
  data_bj1=data_bj[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
              html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
                 html_nodes('div.where') %>% html_nodes('span.region') %>% 
                 html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
             html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
               html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_bj2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_bj <- data.frame(rbind(data_bj1,data_bj2))
}

DT::datatable(data_bj)


#guangzhou
url0 <- 'http://gz.fang.lianjia.com/loupan/'
data_gz=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:2)
{
  data_gz1=data_gz[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_gz2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_gz <- data.frame(rbind(data_gz1,data_gz2))
}

DT::datatable(data_gz)



#nanjing
url0 <- 'http://nj.fang.lianjia.com/loupan/'
data_nj=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:4)
{
  data_nj1=data_nj[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_nj2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_nj <- data.frame(rbind(data_nj1,data_nj2))
}

DT::datatable(data_nj)



#chengdu
url0 <- 'http://cd.fang.lianjia.com/loupan/'
data_cd=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:19)
{
  data_cd1=data_cd[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_cd2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_cd <- data.frame(rbind(data_cd1,data_cd2))
}

DT::datatable(data_cd)




#chongqing
url0 <- 'http://cq.fang.lianjia.com/loupan/'
data_cq=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:11)
{
  data_cq1=data_cq[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_cq2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_cq <- data.frame(rbind(data_cq1,data_cq2))
}

DT::datatable(data_cq)

#changsha
url0 <- 'http://cs.fang.lianjia.com/loupan/'
data_cs=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:5)
{
  data_cs1=data_cs[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_cs2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_cs <- data.frame(rbind(data_cs1,data_cs2))
}

DT::datatable(data_cs)


#qingdao
url0 <- 'http://qd.fang.lianjia.com/loupan/'
data_qd=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:5)
{
  data_qd1=data_qd[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_qd2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_qd <- data.frame(rbind(data_qd1,data_qd2))
}

DT::datatable(data_qd)


#dalian
url0 <- 'http://dl.fang.lianjia.com/loupan/'
data_dl=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:7)
{
  data_dl1=data_dl[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_dl2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_dl <- data.frame(rbind(data_dl1,data_dl2))
}

DT::datatable(data_dl)

#shanghai
url <- 'http://sh.fang.lianjia.com/loupan/'
web <- read_html(url)
name1 <- web %>% html_nodes('div.info-panel') %>%html_nodes('h2') %>%  
  html_nodes('a') %>% html_text()
addres <- web %>% html_nodes('div.info-panel') %>% 
  html_nodes('div.row') %>% html_nodes('a.region') %>% 
  html_text()
address1 <- str_trim(addres)
b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.row')%>% 
  html_nodes('a.area') %>% html_text()
are=str_trim(b)
area1=unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]{3}'))
price1 <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average')%>% html_nodes('span.num') %>%
  html_text() 
type1 <- web %>% html_nodes('div.info-panel') %>%html_nodes('h2') %>%  
  html_nodes('span.propertype.label') %>% html_text()
status1 <- web %>% html_nodes('div.info-panel') %>%html_nodes('h2') %>%  
  html_nodes('span.status.label') %>% html_text()

url <- 'http://sh.fang.lianjia.com/loupan/pg2'
web <- read_html(url)
name2 <- web %>% html_nodes('div.info-panel') %>%html_nodes('h2') %>%  
  html_nodes('a') %>% html_text()
addres <- web %>% html_nodes('div.info-panel') %>% 
  html_nodes('div.row') %>% html_nodes('a.region') %>% 
  html_text()
address2 <- str_trim(addres)
b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.row')%>% 
  html_nodes('a.area') %>% html_text()
are=str_trim(b)
area2=unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]{3}'))
price2 <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average')%>% html_nodes('span.num') %>%
  html_text() 
type2 <- web %>% html_nodes('div.info-panel') %>%html_nodes('h2') %>%  
  html_nodes('span.propertype.label') %>% html_text()
status2 <- web %>% html_nodes('div.info-panel') %>%html_nodes('h2') %>%  
  html_nodes('span.status.label') %>% html_text()  

area21=c(area2[1:6],0,area2[7])
data_sh=data.frame(楼盘名=c(name1,name2),面积=c(area1,area21),
                      价格=c(price1,price2),地址=c(address1,address2),
                      类型=c(type1,type2),状态=c(status1,status2))  

DT::datatable(data_sh)

#shenzhen
url0 <- 'http://sz.fang.lianjia.com/loupan/'
data_sz=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:5)
{
  data_sz1=data_sz[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_sz2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_sz <- data.frame(rbind(data_sz1,data_sz2))
}

DT::datatable(data_sz)


#shijiazhuang
url0 <- 'http://sjz.fang.lianjia.com/loupan/'
data_sjz=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:3)
{
  data_sjz1=data_sjz[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_sjz2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_sjz <- data.frame(rbind(data_sjz1,data_sjz2))
}

DT::datatable(data_sjz)



#tianjin
url0 <- 'http://tj.fang.lianjia.com/loupan/'
data_tj=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:4)
{
  data_tj1=data_tj[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_tj2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_tj <- data.frame(rbind(data_tj1,data_tj2))
}

DT::datatable(data_tj)



#wuhan
url0 <- 'http://wh.fang.lianjia.com/loupan/'
data_wh=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:3)
{
  data_wh1=data_wh[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_wh2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_wh <- data.frame(rbind(data_wh1,data_wh2))
}

DT::datatable(data_wh)



#hangzhou
url0 <- 'http://hz.fang.lianjia.com/loupan/'
data_hz=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:2)
{
  data_hz1=data_hz[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_hz2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_hz <- data.frame(rbind(data_hz1,data_hz2))
}

DT::datatable(data_hz)





#xian
url0 <- 'http://xa.fang.lianjia.com/loupan/'
data_xa=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:26)
{
  data_xa1=data_xa[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_xa2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_xa <- data.frame(rbind(data_xa1,data_xa2))
}

DT::datatable(data_xa)




#jinan
url0 <- 'http://jn.fang.lianjia.com/loupan/'
data_jn=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:2)
{
  data_jn1=data_jn[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_jn2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_jn <- data.frame(rbind(data_jn1,data_jn2))
}

DT::datatable(data_jn)


#yantai
url0 <- 'http://yt.fang.lianjia.com/loupan/'
data_yt=data.frame(楼盘名=1,面积=1,价格=1,地址=1,类型=1,状态=1)
for(i in 1:3)
{
  data_yt1=data_yt[-1,]
  url <- paste(url0,"pg",i,sep = '')
  web <- read_html(url)
  name <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('a') %>% html_text()
  address <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.where') %>% html_nodes('span.region') %>% 
    html_text()
  b=web %>% html_nodes('div.info-panel') %>% html_nodes('div.area') 
  are=rep(0,length(b))
  for (i in 1:length(b))
  {
    if (str_length(b[i]) > 60){
      are[i] =  b[i]%>% html_nodes('span') %>% html_text()
    }else{
      are[i] = 0
    }
  }
  area=ifelse(are=='0','0',unlist(str_extract(are,'[0-9]+~[0-9]+|[0-9]+')))
  a <- web %>% html_nodes('div.info-panel') %>% html_nodes('div.average') 
  pric=rep(0,length(a))
  for (i in 1:length(a))
  {
    if (str_length(a[i]) > 100){
      pric[i] = a[i]%>% html_nodes('span.num') %>% html_text()
    }else{
      pric[i] = 0
    }
  }
  price=pric
  type <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.live') %>% html_text()
  status <- web %>% html_nodes('div.info-panel') %>% 
    html_nodes('div.type') %>% html_nodes('span.onsold') %>% html_text()
  data_yt2 <- data.frame(楼盘名=name,面积=area,价格=price,地址=address,
                            类型=type,状态=status)
  data_yt <- data.frame(rbind(data_yt1,data_yt2))
}

DT::datatable(data_yt)


#save(data_bj,data_cd,data_cq,data_cs,data_dl,data_gz,data_hz,data_jn,
#     data_nj,data_qd,data_sh,data_sjz,data_sz,data_tj,data_wh,data_xa,data_yt,
#    file = 'F:/R/liangjia/lianjia.rdata')

data=list(bj=data_bj,cd=data_cd,cq=data_cq,cs=data_cs,dl=data_dl,gz=data_gz,
     hz=data_hz,jn=data_jn,nj=data_nj,qd=data_qd,sh=data_sh,siz=data_sjz,
     sz=data_sz,tj=data_tj,wh=data_wh,xa=data_xa,yt=data_yt)

save(data,data_bj,data_cd,data_cq,data_cs,data_dl,data_gz,data_hz,data_jn,
    data_nj,data_qd,data_sh,data_sjz,data_sz,data_tj,data_wh,data_xa,data_yt,
     file = 'F:/R/liangjia/lianjia.rdata')












