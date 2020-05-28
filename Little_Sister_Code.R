pitch_name <- "Little_Sister"

Little_Sister <- read.csv('20182019/Little_Sister/Little_Sister.csv')
Little_Sister_J1 <- read.csv('20182019/Little_Sister/Little_Sister_JURY_MEMBER_1.csv')
Little_Sister_J2 <- read.csv('20182019/Little_Sister/Little_Sister_JURY_MEMBER_2.csv')
Little_Sister_J3 <- read.csv('20182019/Little_Sister/Little_Sister_JURY_MEMBER_3.csv')

Little_Sister_J1 <- Little_Sister_J1[1:nrow(Little_Sister),]
Little_Sister_J2 <- Little_Sister_J2[1:nrow(Little_Sister),]
Little_Sister_J3 <- Little_Sister_J3[1:nrow(Little_Sister),]
  

J1_AU06_mimicry <- NA
J1_AU07_mimicry <- NA
J1_AU12_mimicry <- NA
for(i in 1:nrow(Little_Sister_J1)) {
  J1_AU06_mimicry[i] <- mean(Little_Sister_J1$AU06_r[(i+7):(i+24)])
  J1_AU07_mimicry[i] <- mean(Little_Sister_J1$AU07_r[(i+7):(i+24)])
  J1_AU12_mimicry[i] <- mean(Little_Sister_J1$AU12_r[(i+7):(i+24)])
}

J2_AU06_mimicry <- NA
J2_AU07_mimicry <- NA
J2_AU12_mimicry <- NA
for(i in 1:nrow(Little_Sister_J2)) {
  J2_AU06_mimicry[i] <- mean(Little_Sister_J2$AU06_r[(i+7):(i+24)])
  J2_AU07_mimicry[i] <- mean(Little_Sister_J2$AU07_r[(i+7):(i+24)])
  J2_AU12_mimicry[i] <- mean(Little_Sister_J2$AU12_r[(i+7):(i+24)])
}

J3_AU06_mimicry <- NA
J3_AU07_mimicry <- NA
J3_AU12_mimicry <- NA
for(i in 1:nrow(Little_Sister_J3)) {
  J3_AU06_mimicry[i] <- mean(Little_Sister_J3$AU06_r[(i+7):(i+24)])
  J3_AU07_mimicry[i] <- mean(Little_Sister_J3$AU07_r[(i+7):(i+24)])
  J3_AU12_mimicry[i] <- mean(Little_Sister_J3$AU12_r[(i+7):(i+24)])
}

Little_Sister_Processed <- cbind(Little_Sister, J1_AU06_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J1_AU07_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J1_AU12_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J2_AU06_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J2_AU07_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J2_AU12_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J3_AU06_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J3_AU07_mimicry)
Little_Sister_Processed <- cbind(Little_Sister_Processed, J3_AU12_mimicry)

Little_Sister_Processed <- Little_Sister_Processed[which(Little_Sister_Processed$J1_AU06_mimicry != 'NA'),]
write.csv(Little_Sister_Processed, file = '20182019/Little_Sister/Little_Sister_Processed.csv')


cor_AU06_J1 <- cor(Little_Sister_Processed$AU06_r, Little_Sister_Processed$J1_AU06_mimicry)
cor_AU06_J2 <- cor(Little_Sister_Processed$AU06_r, Little_Sister_Processed$J2_AU06_mimicry)
cor_AU06_J3 <- cor(Little_Sister_Processed$AU06_r, Little_Sister_Processed$J3_AU06_mimicry)
cor_AU07_J1 <- cor(Little_Sister_Processed$AU07_r, Little_Sister_Processed$J1_AU07_mimicry)
cor_AU07_J2 <- cor(Little_Sister_Processed$AU07_r, Little_Sister_Processed$J2_AU07_mimicry)
cor_AU07_J3 <- cor(Little_Sister_Processed$AU07_r, Little_Sister_Processed$J3_AU07_mimicry)
cor_AU12_J1 <- cor(Little_Sister_Processed$AU12_r, Little_Sister_Processed$J1_AU12_mimicry)
cor_AU12_J2 <- cor(Little_Sister_Processed$AU12_r, Little_Sister_Processed$J2_AU12_mimicry)
cor_AU12_J3 <- cor(Little_Sister_Processed$AU12_r, Little_Sister_Processed$J3_AU12_mimicry)


corrs <- cbind(pitch_name, cor_AU06_J1, cor_AU06_J2, cor_AU06_J3, cor_AU07_J1, cor_AU07_J2, cor_AU07_J3, cor_AU12_J1, cor_AU12_J2, cor_AU12_J3)

corrdata <- rbind(corrdata, corrs)

