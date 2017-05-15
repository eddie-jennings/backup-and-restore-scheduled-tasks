#Run with Administrator privileges


$taskStoragePath = "\NameOfPathInTaskScheduler\" # \ is the root of the Task Scheduler
$taskBackupPath = "C:\PathToWhereXMLFileWillLive\"
$tasks = Get-ScheduledTask -TaskPath $taskStoragePath

foreach ($tasks in $tasks) { Export-ScheduledTask -TaskName $tasks.TaskName -TaskPath $taskStoragePath | out-file -FilePath $($taskBackupPath + $tasks.TaskName + ".xml") }

(Get-ScheduledTask -TaskPath $taskStoragePath) | Export-Csv $($taskBackupPath + "alltasks.csv") #Used in the restore script for Task Names