import java.util.Scanner;

public class ExScanner {
	public static void main(String[] args) {
		//이름, 별명, 나이을 입력
		Scanner scanner = new Scanner(System.in);
		System.out.println("이름을 입력하세요: ");
		String name = scanner.next();
		System.out.println("입력한 이름은"+name);
		nickName();
		
		System.out.println("나이를 입력하세요");
		int age = scanner.nextInt();
		System.out.println("입력한 나이는"+age);
		scanner.close();
 	}
	private static void nickName() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("별명을 입력하세요");
		String nickName = scanner.next();
		System.out.println("별명은"+nickName); //키보드로부터 nickName 받아서 뿌려
//		scanner.close(); 	//누를때 마다 버퍼생겨   버펑에만 뽑아 \n나오기 전까지.  h아스키코드  o아스키코드 
							//똑같은데서 또 빨대를 꼽아. scannerclose 하면 앞에scanner까지 닫혀. 
							//그래서. scanner.close하지마 //JVM이 알아서 처리
		
	}
}