// JavaScript source code
function chk() {
    if (frm.name.value.length < 2) {
        alert("�̸��� 2���� �̻� �Է��ؾߵ˴ϴ�");
        return false;
    } else if (frm.id.value.length < 4) {
        alert("���̵�� 4���� �̻� �Է��ؾߵ˴ϴ�");
        return false;
    } else if (frm.pw.value.length < 1) {
        alert("��й�ȣ�� 1���� �̻� �Է��ؾߵ˴ϴ�");
        return false;
    } else if (frm.pwChk.value.length < 1) {
        alert("Ȯ�ο��й�ȣ�� 1���� �̻� �Է��ؾߵ˴ϴ�");
        return false;
    } return true;
}