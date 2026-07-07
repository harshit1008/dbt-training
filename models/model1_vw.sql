{{
  config(
    materialized = "table",
    tags = ["core", "events"]
  )
}}


select 1 as col1, 2 as col2