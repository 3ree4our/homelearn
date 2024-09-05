package org.threefour.homelearn.chapter.mapper;

import java.util.List;

import org.threefour.homelearn.chapter.domain.Chapter;

public interface ChapterMapper {
	public void insert(Chapter chapter);
	public Chapter getChapter(Chapter chapter);
	public List<String> getChapterName(long course_id);
	public List<Chapter> getChapter2(long course_id);
}
