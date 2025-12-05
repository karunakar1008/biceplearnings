$Location="North Europe"
$ResourceGroupName="web-grp"
$AppServicePlanName="learningplan7000"

New-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName `
-Location $Location -Tier Free -Linux

$AppName="leaningapp588787"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName `
-AppServicePlan $AppServicePlanName