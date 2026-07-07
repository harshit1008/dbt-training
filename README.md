# dbt-training

**This repo** contains a small dbt project configured to run against Databricks.

**Files added:**
- [profiles_databricks.yml.example](profiles_databricks.yml.example) — example `profiles.yml` for Databricks

**Quick start**

**Prerequisites**:
- Python 3.8+ installed
- Databricks workspace, SQL warehouse, and a personal access token (PAT)
- Git

**1) Create and activate a virtual environment**
```bash
python3 -m venv dbt-env
source dbt-env/bin/activate
pip install --upgrade pip
```

**2) Install dbt + Databricks adapter**
```bash
pip install dbt-databricks
# or explicitly: pip install dbt-core dbt-databricks
```

**3) Create your `profiles.yml` from the example**
Copy the example to your local dbt profiles directory and edit the placeholders:
```bash
cp profiles_databricks.yml.example ~/.dbt/profiles.yml
# then edit ~/.dbt/profiles.yml and fill in: host, http_path, catalog, token
```

See the example in [profiles_databricks.yml.example](profiles_databricks.yml.example).

**Profiles example**

Copy this snippet into your `~/.dbt/profiles.yml` (or use the provided example file) and replace placeholders:

```yaml
dbt_training:
	outputs:
		databricks:
			type: databricks
			host: dbc-9d8c5a55-b9bc.cloud.databricks.com
			http_path: /sql/1.0/warehouses/ae94c45177f93bb2
			catalog: dbt-training
			schema: raw
			token: <YOUR_DATABRICKS_TOKEN>
			threads: 4
	target: databricks
```


**4) Test the connection**
```bash
dbt debug --profiles-dir ~/.dbt --target databricks
```

**5) Run the project**
- Load seeds (if any):
```bash
dbt seed --vars '{"load_source_data": true}' --target databricks
```
- Run models:
```bash
dbt run --target databricks
```
- Run tests:
```bash
dbt test --target databricks
```

**Notes & best practices**
- Do NOT commit `~/.dbt/profiles.yml` — it contains secrets. This repo already ignores `profiles.yml`.
- Use the `profiles_databricks.yml.example` as a template and store secrets in secure vaults or environment variables where possible.
- If you want Databricks to be the default target, set `target: databricks` in your `profiles.yml`.

If you want, I can also add a `requirements.txt` or pin specific `dbt` versions.