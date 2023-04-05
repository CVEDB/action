<h1 align="center">CVEDB Action <a href="https://twitter.com/intent/tweet?text=GitHub%20Action%20for%20CVEDB%20Workflows%20%40trick3st%0Ahttps%3A%2F%2Fgithub.com%2Fcvedb%2Faction&hashtags=infosec,recon,bugbountytips,redteam"><img src="https://img.shields.io/badge/Tweet--lightgrey?logo=twitter&style=social" alt="Tweet" height="20"/></a></h1>
<h3 align="center">GitHub Action for CVEDB Workflows
</h3>


This action is using [CVEDV Client](https://github.com/cvedb/cvedb-cli) execute function to manipulate the directory structures, execute the workflow, and download its output.

It can be used for various purposes such as 
* Vulnerability Scanning
* Misconfiguration Scanning
* Container Security
* Web Application Scanning
* Asset Discovery
* Network Scanning
* Fuzzing
* Static Code Analyis
* ... and a lot more

For more workflow examples, check out the [CVEDB Store](https://cvedb.github.io/dashboard/store).

[<img src="./banner.png" />](https://cvedb-access.paperform.co/)

## Table of Contents

  - [Environment Variables](#environment-variables)
  - [Example Workflows](#example-workflows)
    - [For Remote Executions](#for-remote-executions)
    - [For Local Executions](#for-local-executions) (Coming soon!)
  - [License](#license)


## Environment Variables

Authentication token can be supplied as an environment variable CVEDB_TOKEN.

## Available Inputs


| Key                 | Description                                                                                                             | Required |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------| -------- |
| `space`             | Space where the workflow will be executed                                                                               | true     |
| `workflow`          | Workflow name to be executed. If not present, it will be copied from the store. (https://cvedb.github.io/dashboard/store )  | true     |
| `project`           | Project where workflow will be executed, not required.                                                                  | false    |
| `config_path`       | Configuration for the workflow. Example can be found at config.yaml.                                                    | false    |
| `workflow_new_name` | Executes a workflow from store and creates new one with data provided.                                                  | false    |
| `output_dir`        | Output directory for output files and folders                                                                           | false    |
| `show_params`       | Show parameters in the workflow tree                                                                                    | false    |
| `watch`             | Watch the execution in real time                                                                                        | false    |
| `output`            | Download specific node's outputs                                                                                        | false    |
| `create_structure`  | Create spaces and projects if they don't exist.                                                                         | false    |
| `max_machines`      | Use maximum number of machines for workflow execution                                                                   | false    |


## Example Workflows

### For Remote Executions 

Execute worfklows directly from the Store or already present workflows in your workspace.

```yml
---
name: CVEDB Client

on:
  push:

jobs:         
  cvedb-execute-workflow:
    runs-on: ubuntu-latest
    steps:

    - name: Check Out
      uses: actions/checkout@main

    - name: CVEDB Execute
      id: cvedb
      uses: cvedb/action@main
      env:
        CVEDB_TOKEN: "${{ secrets.CVEDB_TOKEN }}"
      with:
        workflow: "Simple Visual Recon"
        space: "CI-CD"
        create_structure: true
        project: "v1.0"
        watch: true
        output_dir: reports
        #output_all: true
        output: "zip-to-out"
        config: config.yaml
```

`config.yaml`

```
inputs:   # List of input values for the particular workflow nodes.
  amass-1.domain: example.com # <node_id>.<parameter_name>: <parameter_value>
machines: # Machines configuration by type related to execution parallelisam.
  large:  1
outputs:  # List of nodes whose outputs will be downloaded.
  - zip-to-out
```

## License

- [MIT License](https://github.com/trickest/action/blob/main/LICENSE)

[<img src="./banner.png" />](https://trickest-access.paperform.co/)
