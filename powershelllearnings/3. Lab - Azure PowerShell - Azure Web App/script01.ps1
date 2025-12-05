$Location="North Europe"
$ResourceGroupName="web-grp"

# Create a Resource Group
New-AzResourceGroup -Name $ResourceGroupName -Location $Location

# Create an App Service Plan
$AppServicePlanName="learningplan7000"
$AppServicePlan = New-AzAppServicePlan -Name $AppServicePlanName -Location $Location -ResourceGroupName $ResourceGroupName -Tier "Free" 

# Create a Web App
$WebAppName="learningwebapp7000"
$WebApp = New-AzWebApp -Name $WebAppName -Location $Location -AppServicePlan $AppServicePlan.Name -ResourceGroupName $ResourceGroupName     

# Output the Web App details
$WebApp