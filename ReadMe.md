--Create new app registration

az ad sp create-for-rbac --name "my-bicep-sp" --skip-assignment

--get current subscription id

$SUBSCRIPTION_ID=$(az account show --query id -o tsv)

--Set new variable app_id
$APP_ID="<appId-from-previous-command>"

--Add roleassignment 
az role assignment create \
  --assignee $APP_ID \
  --role Contributor \
  --scope /subscriptions/$SUBSCRIPTION_ID

--Create new secret on to the existing app registration

az ad app credential reset \
  --id <appId or objectId> \
  --display-name "my-secret" \
  --years 2

--Login using service principle
az login \
  --service-principal \
  --username <appId> \
  --password <password> \
  --tenant <tenantId>

--Deploy file

  New-AzDeployment -LOcation eastus -templatefile ./01-rg.json

--delete app registration
  az ad app delete --id <appid>