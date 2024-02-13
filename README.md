A Simple project to get started with dbt, Elementary and BigQuery

### Using the project



### To install elementary
    pip install elementary

### Installing elementary-data
    pip install elementary-data

### To Install elementary-data for BigQuery
    pip install 'elementary-data[bigquery]'

### Share observability report to Google Cloud Storage bucket 
    edr send-report --google-service-account-path <SERVICE_ACCOUNT_PATH> --gcs-bucket-name <BUCKET_NAME>


### Share observability report
    edr send-report


### Add elementary to `packages.yml`

Add the following to your packages.yml file (if missing, create it where dbt_project.yml is):

    packages:
    - package: elementary-data/elementary
        version: 0.13.0
    


### Add to your `dbt_project.yml`

Elementary models will have their own schema. The schema will be named elementary or <target_schema>_elementary. Make sure your user has permissions to create schemas.

Add the following to your dbt_project.yml file:

    models:
        elementary:
            ## elementary models will be created in the schema '<your_schema>_elementary'
            +schema: "elementary"
            ## To disable elementary for dev, uncomment this:
            # enabled: "{{ target.name in ['prod','analytics'] }}"

### Import the package and build Elementary models:
    dbt deps
    dbt run --select elementary


### Validate the installation by running some tests:

        dbt test

### Elementary profile details and format
- Path: 

        HOME_DIR/.dbt/profiles.yml
- Profile name: 
        
        elementary
- Schema name: The schema of elementary models, default is <your_dbt_project_schema>_elementary




        ## BIGQUERY ##
        ## By default, edr expects the profile name 'elementary'.      ##
        ## Configure the database and schema of elementary models.     ##
        ## Check where 'elementary_test_results' is to find it.        ##

        elementary:
        outputs:
            default:
            type: bigquery

            ## Service account auth ##
            method: service-account
            keyfile: [full path to your keyfile]

            project: [project id]
            dataset: [dataset name] # elementary dataset, usually [dataset name]_elementary
            threads: 4
            location: [dataset location]
            priority: interactive


### Resources:


Try running the following commands:

    dbt build # build all models
    dbt run # build all models
    dbt run --models <model_name> # build a specific model
    dbt run --models <model_name> --target <target_name> # build a specific model for a specific target
    dbt test # run all tests
    dbt test --models <model_name> # run tests for a specific model
    dbt test --models <model_name> --target <target_name> # run tests for a specific model for a specific target
    dbt seed # run all seeds
    dbt seed --full-refresh # run all seeds with full refresh
    dbt seed --models <model_name> # run a specific seed
    dbt seed --models <model_name> --full-refresh # run a specific seed with full refresh
    dbt deps # install all dependencies
    dbt debug # debug your dbt project
    dbt docs generate # generate documentation
    dbt docs serve  # serve documentation
    dbt snapshot # run all snapshots
    dbt snapshot --select <model_name> # run a specific snapshot
    dbt snapshot --select <model_name> --target <target_name> # run a specific snapshot for a specific target
    edr report  # generate observability report
    edr report --select last_invocation # generate observability report for last invocation
    edr report --select last_invocation --target <target_name> # generate observability report for last invocation for a specific target
    dbt run --select elementary # build elementary



##### Dbt docs: 
- Learn more about  [dbt](https://docs.getdbt.com/docs/introduction)

##### Elementary docs: 
- Learn more about [Elementary](https://docs.elementary-data.com/)

