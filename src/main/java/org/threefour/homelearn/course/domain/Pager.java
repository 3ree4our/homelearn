package org.threefour.homelearn.course.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Pager {
	private java.util.List<Course> list;
	private int pageNum;    // �������� ��ȣ
	private int totalBoard; // �Խñ��� ����
	private int pageSize;   // �������� ��µǴ� �Խñ� ���� (n���� ����)
	private int blockSize;  // �� ���� ��µǴ� ������ ��ȣ ����

	private int totalPage;  // ��ü ������ ����
	private int startRow;   // ��û �������� ��µǴ� �Խñ��� ���� ���ȣ
	private int endRow;     // ��û �������� ��µǴ� �Խñ��� ���� ���ȣ
	private int startPage;  // ���� ��µǴ� ���� ������ ��ȣ
	private int endPage;    // ���� ��µǴ� ���� ������ ��ȣ
	private int prevPage;   // ���� ���� ��µǴ� ���� ������ ��ȣ
	private int nextPage; 
	private int offsetSize;// ���� ���� ��µǴ� ���� ������ ��ȣ
	public Pager(int pageNum, int totalBoard, int pageSize, int blockSize) {
		super();
		this.pageNum = pageNum;
		this.totalBoard = totalBoard;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		//calcPage();
	}
	
	public void calcPage() {
		// �� �Խù� ���� �������� ǥ�õǴ� �Խù� ���� ���� ��ü �������� ������ ���մϴ�.
		totalPage=(int)Math.ceil((double)totalBoard/pageSize);
		
		// ������ ��ȣ�� ��ü ������ �� ���� ū ��� ������ ��ȣ�� 1�� ����
		if(pageNum<=0 || pageNum>totalPage) {
			pageNum=1;
		}
		
		// ���� �� �� �� ��ȣ
		startRow=(pageNum-1)*pageSize+1;
 		endRow=pageNum*pageSize;
		if(endRow>totalBoard) {
			endRow=totalBoard;
		}
		
		// �� ���� ��µǴ� �� ������ �������� ������ ��ȣ�� ���
		startPage=(pageNum-1)/blockSize*blockSize+1;
		endPage=startPage+blockSize-1;
		if(endPage>totalPage) {
			endPage=totalPage;
		}
		
		// ���� �� ���� ���� ���� ������ ��ȣ ���
		prevPage=startPage-blockSize;
		nextPage=startPage+blockSize;
	}
}
