$Location="North Europe"
$ResourceGroupName="web-grp"
$AppServicePlanName="learningplan7000"

New-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName `
-Location $Location -Tier Basic

$AppName="leaningapp588787"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName `
-AppServicePlan $AppServicePlanName

# Configure deployment from GitHub
$GitRepoUrl="https://github.com/karunakar1008/BlazorBlackBelt.git"
$GitBranch="main"

$PropertiesObject = @{
    repoUrl = $GitRepoUrl;
    branch =$GitBranch;
    isManualIntegration = "true";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/sourcecontrols `
-ResourceName $AppName/web -ApiVersion 2015-08-01 -Force

# Restart the web app to apply changes
Restart-AzWebApp -ResourceGroupName $ResourceGroupName -Name $AppName
Write-Output "Web App deployed successfully. Access it at: https://$AppName.azurewebsites.net"

# Output the URL of the deployed web app
Write-Output "Web App URL: https://$AppName.azurewebsites.net"
