#sql("list")
select #(columns?? "*") from #(table) #@where() #@order(true)
#end

#sql("delete")
delete from #(table) #@where() #@order(false)
#end

#sql("optionlist")
select #(value) as value,#(text) as text from #(table) #@where() #@order(true)
#end

#sql("count")
select count(*) from #(table) #@where() #@order(false)
#end

#sql("first")
select * from #(table) #@where() and rownum=1 #@order(true)
#end

#sql("firstrand")
select * from #(table) #@where()  and rownum=#(randomRownum) #@order(false)
#end