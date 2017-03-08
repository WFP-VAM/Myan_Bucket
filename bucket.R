

#### Parameters
sample_size = 19 # Size of sample
number_of_positives = c(0:sample_size) # Number of observed positives
p.low = 0.03 # First p
confidence_level = "0.95%"


if (confidence_level == "0.90%"){th.lo = 0.05
                                th.hi = 0.95 }
if (confidence_level == "0.95%"){th.lo = 0.025
                                th.hi = 0.975}

#### Functions
x_trunc = function(x){
  '
  Truncate the binomial following the given confidence interval
  Return the corresponding number_of_positives
  '
  which(th.lo<=x & x<=th.hi)
}

y_trunc = function(curve){
  '
  Truncate the binomial following the given confidence interval
  Return the binomial 
  '
  curve[x_trunc(curve)]
}


#### First draw our first binomial over which we will loop

lowest_binomial = pbinom(number_of_positives, 
                         sample_size, 
                         p.low, 
                         lower.tail = TRUE)
x.lowest = x_trunc(lowest_binomial) # Number of positives corresponding to p.low
x.max = max(x.lowest) # Biggest number of positives covered by p.low

# Plot the binomial
plot(6,6,type="n",axes=TRUE, ann=FALSE,
     xlim=c(0, sample_size),ylim = seq(0,1), 
     xaxs="i",yaxs="i") 
abline(v=tail(x.lowest,1),col='black',lty=3)
text(min(x.lowest),0.95,sprintf("p = %s", p.low),cex=0.5, col='red')
axis(1, at=number_of_positives,labels=number_of_positives)
title(xlab= 'Number of positives', 
      ylab= 'Most likely real proportion', 
      main =sprintf("    Distribution of binomials for n =  %s
      and intervall of confidence = %s", 
                    sample_size, confidence_level ))

lines(x.lowest, y_trunc(lowest_binomial), col='red')


#### Generate the directly following binomials without overlapping

bucket.count = 1  # Number of bucket created
for (p in seq(p.low, 1, by=0.01)){
  binomial = pbinom(number_of_positives, sample_size, p, lower.tail = TRUE)
  x=x_trunc(binomial)
  if (min(x) < x.max){next}
  if (length(x) < 2){next} # To get ride of intervall with only one value
  lines(x, y_trunc(binomial), col='red')
  abline(v=tail(x,1),col='black',lty=3)
  text(min(x),0.95,sprintf("p = %s", p),pos=4, cex=0.5, col='red')
  x.max = max(x)
  bucket.count = bucket.count + 1
}

text(0.05, 0.05, sprintf('Number of buckets = %s', bucket.count), cex = 0.8, pos = 4)

