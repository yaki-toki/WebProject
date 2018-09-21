<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%
	String fileName = request.getParameter("file_name");
	String savePath = "upload";
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	// 업로드 된 실제 경로를 찾아 온다.
	
	String sFilePath = sDownloadPath + "\\" + fileName;
	// 서버에 올라간 파일 이름을 받아온다. 오리지널 이름 아님
	
	byte b[] = new byte[4096];
	File oFile = new File(sFilePath);
	FileInputStream in = new FileInputStream(sFilePath);
	// 자바 클레스에서 제공되는 클래스
	// 4096의 베열 공간에 두고, 파일 경로를 넣어 준다.
	// 해당 경로에서 파일을 읽어 올 수 있게 된다.
	
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>" + sMimeType);
	// 파일의 타입을 알아온다.
	
	//octet-steam은 8비트로 된 일련의 데이터를 듯합니다. 지정되지 않은 파일 형식을 의미
	//변경되지 않음
	if (sMimeType == null)
		sMimeType = "application/octet-stream";
	
	//파일 타입을 받아온다.
	response.setContentType(sMimeType);
	
	// 한글 업로드 (이 부분이 한글 파일명이 깨지는 것을 방지해 줍니다.)
	String sEncoding = new String(fileName.getBytes("euc-kr"), "8859_1");
	
	//이부분이 모든 파일 링크를 클릭했을 때 다운로드 화면이 출력되게 처리하는 부분입니다.
	ServletOutputStream out2 = response.getOutputStream();
	int numRead;
	//바이트 배열 b의 0번부터 numRead번 까지 브라우저로 출력
	
	while ((numRead = in.read(b, 0, b.length)) != -1) {
		out2.write(b, 0, numRead);
	}
	// 출력 버퍼를 지워준다.
	out2.flush();
	// 해당 Stream을 닫아준다.
	out2.close();
	// inputStream을 닫아준다.
	in.close();
	
	// 지우고, 지우고, 닫고
%>