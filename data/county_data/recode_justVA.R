fls = list.files()
fls = fls[1:34]


for(f in fls){
  temp = strsplit(f,split='[.]')
  if( temp[[1]][2]=='csv'){
    df = read.csv(f)
    tdf = df[df$STATE=='Virginia',] # Select on VA
    
    # Handle FIPS
    if( !('FIPS' %in% names(tdf) || f=='0002_ts_nominal_county.csv') ){
      # Add fips codes from GEOID
      tdf$FIPS = NA
      fips_split =  strsplit(tdf$GEOID,'US')
      for(k in 1:dim(tdf)[1]){
        tdf[k,]$FIPS = fips_split[[k]][2]
      }
    }
    # Write temp df to utf-8 file
    write.csv(tdf,paste('./utf8_justVA/',f,sep=''), fileEncoding = 'utf-8', row.names=FALSE)
  }
}