package www.yydh.myapp;

public class AppleSpeaker implements Speaker {
	public AppleSpeaker() {
		System.out.println("==> AppleSpeaker 객체 생성");
	}
	
	@Override
	public void voluemeUp() {
		System.out.println("AppleSpeaker---볼륨을 올린다.");
	}


	@Override
	public void volumeDown() {
		System.out.println("AppleSpeaker---볼륨을 내린다.");
	}
	
}
