# dbt TPC-H demo
This is a dbt sample project for Databricks using the `TPC-H` example dataset that ships as a shared database with databricks.

More details can be found on the [TPC website](http://www.tpc.org/tpch/default.asp) and in the [specification document](http://www.tpc.org/tpc_documents_current_versions/pdf/tpc-h_v2.18.0.pdf).

The project is laid out as follows:

- `_schema` contains schema defintions and tests in one `.yml` file per model
- `_source` contains source definitions
- `base` contains `ephemeral` base models that serve as wrappers around source models to define column names and data types where necessary
- `ods` represents an Operational Data Store (ODS), i.e. a mostly normalized view of the data. These models may contain more columns than we may choose to publish to the dimensional data warehouse, but don't contain any reporting models.
- `wh` represents the Dimensional Data Warehouse (WH). These models use a star schema methodology made up of fact (`fct_*`) and dimension (`dim_*`) tables. In addition, this schema contains report models (`rpt_*`) that combine fact and dimension tables for business reporting.



## Profile
- Add a new profile to `~/.dbt/profiles.yml` called `tpch`.

```
tpch:
    target: dev
    outputs:
        prod:
            type: databricks
            threads: 8
            account: <account>
            user: <user>
            password: <password>
            role: <role>
            database: <target_database>
            warehouse: <warehouse>
            schema: <default_schema>

```


## Scaling Factor


Also, note that you can change the scaling factor of the TPCH dataset by switching the source database in `_source/source_tpch.yml` from the default of `10` to `100` or `1000` by changing the database name accordingly.

```
version: 2

sources:
  - name: tpch
    database: tpch
    schema: TPCH_SF10
    loader: tpch

...

```
## Databricks

Using an X-Small warehouse (1 credit / hour), the project currently runs in about *5 minutes* against the `TPCH` database.


---
