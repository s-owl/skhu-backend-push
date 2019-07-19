package com.sowl_notice.service;

import java.util.List;

import com.sowl_notice.model.QnAModel;

public interface QnAService {
   List<QnAModel> qnaList();
   int qnaInsert(QnAModel qnaModel);
   int qnaDelete(int qna_no);
   int qnaUpdate(QnAModel qnaModel);
   int commentUpdate(QnAModel qnaModel);
   int deleteComment(int qna_no);
   int updateComment(QnAModel qnaModel);


}