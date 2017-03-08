# Bucketing prevalence rates 

### Framework : 
Lot Quality Assesment Sampling applied in social science field.    
We want to know the prevalence of one indicator on certain region (the so-called supervision area), in order to assess if this region is well covered.    
For example : a food security indicator. We want to know if for each region we're interested in the population is food secure or not. 

### Method :
Binary classification following a binomial function. 
Basically we take a sample of people, we see how many are food secure and want to conclude if the area sampled can be considered as 'bad' (low level of food security) or 'good' (high level of food security).

### Problematic of this repo :

Given the number of people drawn out of the sample considered as positives, what is the likeliest prevalence of the indicator in our sample ?

In more mathematical words : given the number of success in a sample, what is the likeliest binomial function it has been drawn from and especially following which p ?

### Aim of this repo

We want to construct bucket of the number of people considered as positives, each bucket corresponding to a certain prevalence p at a xx% level of confidence.

Example : if we have drawn seven people positives out of a sample of 19, we aim to show that this proportion refers to a prevalence of 40% with a 95% confidence.

### Implementation : 

First we have to choose :
- the sample size
- the level of confidence

And then we construct non-overlapping binomial CDFs truncated following our level of confidence.

![](https://github.com/WFP-VAM/Myan_Bucket/blob/master/plot19for95.png)
