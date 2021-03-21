## Ourstandard project / 쇼핑몰 제작
### 제작 기간 : 약 2개월 (2020.11.16 - 2021.01.12)

[프로젝트 링크](http://ourstandard.shop)

----------------------

**FrameWork** / Spring Lagacy Project, MyBatis, Bootstrap, Vue.js

**Tools** / STS, Heidi SQL, DBeaver, Eclipse, VSCode

**Language & Skill** / Html, CSS, JavaScript, Java, jQuery, Ajax

**API** / JavaMail API, bilboard.js

**VCS** / GitHub

**Server** / Apache Tomcat

**DB** / MariaDB

**Hosting** / Cafe24

--------------------------

### DB Modeling


### 요구사항
<table>
    <thead>
        <tr>
            <th>Main</th>
            <th>ID</th>
            <th>Name</th>
            <th>Require</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan="5" style="font-weight: bolder">계정</td>
            <td>A0</td>
            <td>비회원</td>
            <td>- 매거진을 열람, 상품은 열람까지 가능</td>
        </tr>
        <tr>
            <td>A1</td>
            <td>회원(구매자)</td>
            <td>- 상품 구매 및 장바구니 이용 가능 <br> - 회원정보 수정 및 탈퇴 가능 <br> - 상품 구매자는 해당 상품 리뷰 가능</td>
        </tr>
        <tr>
            <td>A2</td>
            <td>셀러</td>
            <td>- 회원가입을 위해 어드민의 승인 필요 <br> - 상품을 판매하려는 기업 회원으로서, <br> 하단의 seller 버튼으로 셀러 관리 기능 이용 가능 <br> - 셀러 또한 회원(구매자)활동 가능</td> 
        </tr>
        <tr>
            <td>A3</td>
            <td>어드민</td>
            <td>- Ourstandard 최고관리자 계정, 하단 admin 버튼으로 어드민 관리 기능 사용 가능</td>
        </tr>
        <tr>
            <td>A4</td>
            <td>마이페이지</td>
            <td>- 장바구니, 주문내역, 회원정보 수정 및 탈퇴 가능</td>
        </tr>
        <tr>
            <td rowspan="3" style="font-weight: bolder">쇼핑</td>
            <td>B0</td>
            <td>스토어</td>
            <td>- 대분류 – 성별, 중분류 – 상품종류. 제품을 카드형태로 나열, 제품명 검색 가능 <br> - 상품정보를 보고 상품을 장바구니에 담거나 구매 가능. <br> 리뷰를 볼 수 있으며, 해당 상품을 구매한 회원 리뷰 작성 가능 <br> - 구매 페이지에서 배송 정보로 기존 회원 정보가 출력, 기본 정보 외 새로운 주소 입력 가능</td>
        </tr>
        <tr>
            <td>B1</td>
            <td>장바구니</td>
            <td>- 장바구니 상품들 모아보기 가능, 실시간 수량 변화에 따른 합계 금액 조회 가능 <br> - 체크박스로 되어있는 상품들 복수 선택하여 다중 주문 가능 </td>
        </tr>
        <tr>
            <td>B2</td>
            <td>구매목록</td>
            <td>- 회원이 구매한 내용들을 볼 수 있으며, 후기작성 버튼으로 해당 상품 리뷰 작성 폼을 팝업으로 띄움</td>
        </tr>
        <tr>
            <td style="font-weight: bolder">콘텐츠</td>
            <td>C0</td>
            <td>매거진</td>
            <td>- 어드민이 제작한 매거진을 카드 형태로 나열, 제목 검색 가능 <br> - 매거진 좋아요 버튼으로 횟수를 카운트, 콘텐츠의 반응 정도 예측 가능 <br> - 매거진 콘텐츠 내용에 나오는 상품의 상세페이지 바로 이동 가능</td>
        </tr>
        <tr>
            <td rowspan="3" style="font-weight: bolder">셀러</td>
            <td>D0</td>
            <td>상품 업로드</td>
            <td>- 판매할 수 있는 상품을 등록하는 기능, 상품 CRUD, 옵션 CRUD를 통해 상품 상세화</td>
        </tr>
        <tr>
            <td>D1</td>
            <td>배송관리</td>
            <td>- 해당 셀러의 상품을 회원들이 구매한 내역 조회 및  배송상태를 관리 가능</td>
        </tr>
        <tr>
            <td>D2</td>
            <td>리뷰관리</td>
            <td>- 회원들의 상품 리뷰에 답변 가능, 체크박스로 여러 리뷰 동시에 답변 가능</td>
        </tr>
        <tr>
            <td rowspan="3" style="font-weight: bolder">어드민</td>
            <td>E0</td>
            <td>셀러 가입대기자 승인</td>
            <td>- 회원가입한 대기 회원(셀러) 조회 가능, 가입 승인 및 탈퇴 처리 가능</td>
        </tr>
        <tr>
            <td>E1</td>
            <td>매거진 작성</td>
            <td>- 매거진 관리, 매거진 CRUD 가능</td>
        </tr>
        <tr>
            <td>E2</td>
            <td>통계</td>
            <td>- billboard.js api를 이용, 상품 판매 데이터와 가입 현황을 통계 그래프로 표시 가능</td>
        </tr>
    </tbody>
</table>


--------------------------
## 기능


### 암호화 방식(SHA-256)

```java
public class Encrypt {
    public static String encrypt(String plainText) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(plainText.getBytes());
            byte byteData[] = md.digest();
            StringBuffer sb = new StringBuffer();
            for(int i=0; i<byteData.length;i++) {
                sb.append(Integer.toString((byteData[i]&0xff)+0x100,16).substring(1));
            }
            StringBuffer hexString = new StringBuffer();
            for(int i=0; i<byteData.length;i++) {
                String hex = Integer.toHexString(0xff &byteData[i]);
                if(hex.length()==1) {
                    hexString.append(hex);
                }
                hexString.append(hex);
            }
            return hexString.toString();
        }catch(Exception e) {
            e.printStackTrace();
        }
        throw new RuntimeException();
    }
}
```

### 임시 비밀번호 생성

```java
public class TempPWD{
    public static String randomPw(){
        char pwCollection[] = new char[] {
                '1','2','3','4','5','6','7','8','9','0',
                'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                '!','@','#','$','%','^','&','*','(',')'};//배열에 선언
        String ranPw = "";
        for (int i = 0; i < 10; i++) {
            int selectRandomPw = (int)(Math.random()*(pwCollection.length));
            //Math.rondom()은 0.0이상 1.0미만의 난수를 생성 
            ranPw += pwCollection[selectRandomPw];
        }
        return ranPw;
    }
}
```
임의의 배열 값을 조합해 10자리의 랜덤한 비밀번호 조합을 반환

### 업로드 구현

```java
public class UploadUtil {
	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;
	
	//파일 업로드 메소드
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {
		//무작위 uuid생성
		UUID uid = UUID.randomUUID();
		//업로드되는 파일 이름을 무작위uid+파일이름으로 겹치기 힘들도록 생성
		String newFileName = uid + "_" + fileName;
		//이미지 패스 설정
		String imgPath = uploadPath + ymdPath;
		
		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);
		//썸네일 생성부분, 썸네일 이름은 s_(uid)_(업로드파일이름)
		String thumbFileName = "s_" + newFileName;
		//해당 루트에 이미지 저장.
		File image = new File(imgPath + File.separator + newFileName);
		//해당 루트에 썸네일 저장
		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);
		//이미지가 저장되면 썸네일 생성.
		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		return newFileName;
	}
	
	//현재 날짜 기준으로 폴더를 만들어주는 메소드.
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

		return datePath;
	}
	
	//폴더 생성
	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}
```
