package www.yydh.myapp;

public class SonySpeaker implements Speaker {
	public SonySpeaker() {
		System.out.println("==> SonySpeaker 객체 생성");
	}
	
	public void voluemeUp() {
		System.out.println("SonySpeaker---볼륨을 올린다.");
	}


	public void volumeDown() {
		System.out.println("SonySpeaker---볼륨을 내린다.");
	}
	
}
