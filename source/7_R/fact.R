fact<-function(num){                                                          ######복습!!
  result=1
  if(num<0){
    cat("음수값을 위한 팩토리얼은 존재하지 않습니다")
  }else if(num==0){
    cat("The factorial of 0 is 1")
    #return(1)
  }else{
    for(i in num:1){
      result = result * i
    }
    cat(num,"!=",result)
    #return(result)
  }
}

fact(4)
fact(0)
fact(1)
