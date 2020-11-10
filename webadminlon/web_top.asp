<%'
'str="家政/保姆/保洁服务,驾校/学车/陪驾,美容/保健服务,培训技能/电脑外语,装修服务,维修服务,家教服务,物品回收,车辆服务,学历教育,婚庆/摄影/司仪,搬家/快递/送货,旅游/活动/聚会,网页/平面设计/印刷,会计/翻译/律师服务,公司注册/年检,商家网店,KTV/酒吧,中介房源"
'arry=split(str,",")
'for i=0 to ubound(arry)
'   sql="insert into smallclass(bigid,smallname) values(19,'"&arry(i)&"')"
'   'conn.execute (sql)
'next

%>