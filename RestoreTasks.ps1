#Run with Administrator privileges


Write-Host "Enter task account credentials"

$credential = Get-Credential
$password = $credential.GetNetworkCredential().Password #Security through obscurity
$taskBackupPath = "C:\PathToXMLFiles\"
$taskStoragePath = "\DesiredPathInTaskScheduler\" # \ is the root of the Task Scheduler$
$tasks = Import-Csv ( $taskBackupPath + "alltasks.csv" )


foreach ($task in $tasks ) {
    $config = Get-Content ( $taskBackupPath + $task.taskname + '.xml' ) | Out-String
    Register-ScheduledTask -TaskName ( $task.taskname ) -TaskPath $taskStoragePath -User $credential.UserName -Password $password -Xml $config
    }