#--------------------------------------------------------------------------
#data
dataset=read.csv("C:\\Users\\muradyanyeva\\Desktop\\DepressionDataset.csv")
filter_dataset=names(dataset) %in% c("Wednesday", "Tuesday", "time")
clean_dataset <- dataset[!filter_dataset]

#-------------------------------------------------------------------------
# model
model <- lm(Deprecion.Level ~ ., data = clean_dataset)

# predicts + interval
preds <- predict(model, newdata = clean_dataset, interval = 'confidence', se.fit=TRUE)

#sorting using absolute values of coefficients
filter_sort  = sort(abs(model$coefficients), index.return=TRUE)
coefficients = model$coefficients[filder_sort$ix]

#-------------------------------------------------------------------------
#Plotting
plot(dataset$Deprecion.Level, xlab = "Time", ylab='Feeling Down')
lines(preds$fit[,1], col="red")
lines(preds$fit[,1]+1.0*preds$se.fit, lty=2)
lines(preds$fit[,1]-1.0*preds$se.fit, lty=2)


