# Terraform module for Firebase AppCheck setup

This is a Terraform module to install Firebase AppCheck into an existing Firebase project. 
It requires the [Google Cloud SDK][] to be installed locally and an
existing [Firebase project][Firebase console]. 

App Check documentation:

- Terraform configuration: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_service_config
- Firebase App Check: https://firebase.google.com/docs/app-check

To get started:

1.  Install the [Google Cloud SDK][], [Terraform][Terraform install], and
    [Git][Git install].

2.  Create a [Firebase project][Firebase console] with the Blaze Plan.

3.  Add the following config to your terraform tf file:

    ```
    module "tf-fb-appcheck" {
        source            = "github.com/opentdc/tf-fb-appcheck"
        project_id        = local.project_id
        enforcement_mode  = "UNENFORCED"

        # Wait until all services are provisioned first.
        depends_on = [ module.tf-fb-storage, module.tf-fb-firestore, module.tf-fb-auth-uidpwd]
    }
    ```

4. gcloud auth application-default set-quota-project [PROJECT_ID]
    to avoid Error 403: Your application is authenticating by using local Application Default Credentials. The firebaseappcheck.googleapis.com
    API requires a quota project, which is not set by default.
    see: https://cloud.google.com/docs/authentication/troubleshoot-adc#user-creds-client-based
  
5.  Run `terraform init && terraform apply`


## Input variables

| Variable Name               | Type      | Usage       | Default         | Description                                            |
|-----------------------------|-----------|-------------|-----------------|--------------------------------------------------------|
| project_id                  | string    | mandatory   |                 | The Firebase project ID                                |
| enforcement_mode            | string    | optonal     | UNENFORCED      | The enforcement mode of the Firebase App Check service |


## Output
None