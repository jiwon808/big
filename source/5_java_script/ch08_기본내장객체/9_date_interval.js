//this.getInterval(that);  this���� that�� ������ ��¥ ���

Date.prototype.getInterval = function (that) {
    if (this > that) {                      //********this �� ��ü,  that �Ű������� ���°�
        var intervalMili = this.getTime() - that.getTime();
    } else {
        var intervalMili = that.getTime() - this.getTime();
    }
    var intervalDay = intervalMili / (1000 * 60 * 60 * 24);
    return Math.trunc(intervalDay); //�Լ����� function�ȿ� �� �� �� �ִ� 
};                                                  

//var intervalMili = limitday.getTime() - today.getTime();
//var intervalDay = intervalMili / (1000 * 60 * 60 * 24);