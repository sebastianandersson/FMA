Tibshirani <- function(samplesize, ex) {
  simData <- list(X = NULL, y = NULL, mu = NULL)
  if (ex %in% 1:3) {
    if (ex == 1) {
      Beta <- c(3, 1.5, 0, 0, 2, 0, 0, 0)
      sigma <- 3
    } 
    if (ex == 2) {
      Beta <- rep(0.85, 8)
      sigma <- 3
    }
    if (ex == 3) {
      Beta <- c(5, rep(0, 7))
      sigma <- 2
    } 

    XCov <- outer(1:8, 1:8, function(x, y) 0.5^(abs(x-y)))
    simData$X <- matrix(rnorm(samplesize * 8), ncol = 8) %*% t(chol(XCov))
    simData$mu <- simData$X %*% Beta
  }
  
  if (ex == 4) {
    simData$X <- matrix(rnorm(samplesize * 40), nrow = samplesize, ncol = 40) + matrix(rnorm(samplesize), nrow = samplesize, ncol = 40)
    Beta <- c(rep(0, 10), rep(2, 10), rep(0, 10), rep(2, 10))
    simData$mu <- simData$X %*% Beta
    sigma <- 15
  }
  
  simData$y <- simData$mu + rnorm(samplesize, mean = 0, sd = sigma)
  return(simData)
}