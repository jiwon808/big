// JavaScript source code
function chk() {
    if (frm.name.value.length < 2) {
        alert("이름은 2글자 이상 입력해야됩니다");
        return false;
    } else if (frm.id.value.length < 4) {
        alert("아이디는 4글자 이상 입력해야됩니다");
        return false;
    } else if (frm.pw.value.length < 1) {
        alert("비밀번호는 1글자 이상 입력해야됩니다");
        return false;
    } else if (frm.pwChk.value.length < 1) {
        alert("확인용비밀번호는 1글자 이상 입력해야됩니다");
        return false;
    } return true;
}