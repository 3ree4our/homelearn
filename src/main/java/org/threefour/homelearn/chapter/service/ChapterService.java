package org.threefour.homelearn.chapter.service;

import java.util.List;

import org.threefour.homelearn.chapter.domain.Chapter;

public interface ChapterService {
	
	public void insert(Chapter chapter);
	public Chapter getChapter(Chapter chapter);
	public List<String> getChapterName(long courseId);
	public List<Chapter> getChapter2(long course_id);

}
