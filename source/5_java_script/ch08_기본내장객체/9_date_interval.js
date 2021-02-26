//this.getInterval(that);  this날과 that날 사이의 날짜 계산

Date.prototype.getInterval = function (that) {
    if (this > that) {                      //********this 내 객체,  that 매개변수에 들어온것
        var intervalMili = this.getTime() - that.getTime();
    } else {
        var intervalMili = that.getTime() - this.getTime();
    }
    var intervalDay = intervalMili / (1000 * 60 * 60 * 24);
    return Math.trunc(intervalDay); //함수언어는 function안에 다 쓸 수 있다 
};                                                  

//var intervalMili = limitday.getTime() - today.getTime();
//var intervalDay = intervalMili / (1000 * 60 * 60 * 24);