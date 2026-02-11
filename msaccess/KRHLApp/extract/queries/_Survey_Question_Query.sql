SELECT SurveyQuestions.Question
FROM SurveyQuestions
WHERE (((SurveyQuestions.Team)=Forms!CustomerSurvey!Team))
ORDER BY SurveyQuestions.Team;