
fls = list.files()
fls = fls[1:34]
for(f in fls){
  temp = strsplit(f,split='[.]')
  if( temp[[1]][2]=='csv'){
    df = read.csv(f)
    write.csv(df,paste('./utf8_all/',f,sep=''), fileEncoding = 'utf-8',row.names=FALSE)
  }
}