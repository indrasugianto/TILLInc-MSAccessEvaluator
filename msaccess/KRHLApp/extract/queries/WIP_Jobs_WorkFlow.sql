SELECT WorkFlow.Phase, [>Jobs].ID, WorkFlow.TaskID, WorkFlow.TaskBegin, WorkFlow.Task, WorkFlow.PhaseAmount, WorkFlow.TaskLevel
FROM [>Jobs] LEFT JOIN WorkFlow ON [>Jobs].Key=WorkFlow.Job
WHERE (((WorkFlow.Phase)="Installation" Or (WorkFlow.Phase)="Design" Or (WorkFlow.Phase)="Shop" Or (WorkFlow.Phase)="Stored") AND (([>Jobs].ProductionPhase)="Installation" Or ([>Jobs].ProductionPhase)="Design" Or ([>Jobs].ProductionPhase)="Shop" Or ([>Jobs].ProductionPhase)="Stored") AND (([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))
ORDER BY WorkFlow.Phase, [>Jobs].ID, WorkFlow.TaskID;