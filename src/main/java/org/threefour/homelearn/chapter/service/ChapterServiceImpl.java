package org.threefour.homelearn.chapter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.threefour.homelearn.chapter.domain.Chapter;
import org.threefour.homelearn.chapter.mapper.ChapterMapper;

@Service
public class ChapterServiceImpl implements ChapterService{

	@Autowired
	private ChapterMapper chapterMapper;

	@Override
	public void insert(Chapter chapter) {
		chapterMapper.insert(chapter);
	}

	@Override
	public Chapter getChapter(Chapter chapter) {
		return chapterMapper.getChapter(chapter);
	}

	@Override
	public List<String> getChapterName(long courseId) {
		return chapterMapper.getChapterName(courseId);
	}

	@Override
	public List<Chapter> getChapter2(long course_id) {
		return chapterMapper.getChapter2(course_id);
	}

}
