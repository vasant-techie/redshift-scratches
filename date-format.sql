SELECT
    CASE WHEN CAST(year_column AS INT) >= YEAR(current_date()) % 100
         THEN concat('19', lpad(CAST(year_column AS STRING), 2, '0'))
         ELSE concat('20', lpad(CAST(year_column AS STRING), 2, '0'))
    END AS year_adjusted,
    lpad(CAST(month_column AS STRING), 2, '0') AS month_padded,
    lpad(CAST(day_column AS STRING), 2, '0') AS day_padded,
    concat(
        CASE WHEN CAST(year_column AS INT) >= YEAR(current_date()) % 100
             THEN concat('19', lpad(CAST(year_column AS STRING), 2, '0'))
             ELSE concat('20', lpad(CAST(year_column AS STRING), 2, '0'))
        END,
        '-',
        lpad(CAST(month_column AS STRING), 2, '0'),
        '-',
        lpad(CAST(day_column AS STRING), 2, '0')
    ) AS date_column
FROM
    parquet.`/path/to/your/parquet/file`
