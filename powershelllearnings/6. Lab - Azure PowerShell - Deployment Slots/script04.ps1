$Location="North Europe"
$ResourceGroupName="web-grp"
$AppServicePlanName="learningplan7000"
$AppName="leaningapp588787"
$SlotName="staging"

#Sclae up the App Service Plan to Standard tier to enable deployment slots
Set-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName -Tier "Standard" 

# Create a deployment slot
New-AzWebAppSlot -ResourceGroupName $ResourceGroupName -Name $AppName -Slot $SlotName -AppServicePlan $AppServicePlanName

# Configure deployment from GitHub for the slot
$GitRepoUrl="https://github.com/karunakar1008/BlazorBlackBelt.git"
$GitBranch="master"

$PropertiesObject = @{
    repoUrl = $GitRepoUrl;
    branch =$GitBranch;
    isManualIntegration = "true";
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName `
-ResourceType Microsoft.Web/sites/slots/sourcecontrols `
-ResourceName "$AppName/$SlotName/web" -ApiVersion 2015-08-01 -Force

# Optional 

# Restart the deployment slot to apply changes
Restart-AzWebAppSlot -ResourceGroupName $ResourceGroupName -Name $AppName -Slot $SlotName
Write-Output "Deployment Slot '$SlotName' deployed successfully. Access it at: https://$AppName-$SlotName.azurewebsites.net"


# Output the URL of the deployed slot
Write-Output "Deployment Slot URL: https://$AppName-$SlotName.azurewebsites.net"    

#Swap the deployment slot with production
Swap-AzWebAppSlot -ResourceGroupName $ResourceGroupName -Name $AppName -SourceSlotName $SlotName -DestinationSlotName "production"

Write-Output "Deployment Slot '$SlotName' swapped with production successfully."

# Output the URL of the production slot after swap
Write-Output "Production Slot URL after swap: https://$AppName.azurewebsites.net"

