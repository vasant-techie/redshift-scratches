SELECT
    CASE WHEN CAST(year_column AS INTEGER) >= DATE_PART('year', current_date) % 100
         THEN CONCAT('19', LPAD(CAST(year_column AS VARCHAR), 2, '0'))
         ELSE CONCAT('20', LPAD(CAST(year_column AS VARCHAR), 2, '0'))
    END AS year_adjusted,
    LPAD(CAST(month_column AS VARCHAR), 2, '0') AS month_padded,
    LPAD(CAST(day_column AS VARCHAR), 2, '0') AS day_padded,
    CONCAT(
        CASE WHEN CAST(year_column AS INTEGER) >= DATE_PART('year', current_date) % 100
             THEN CONCAT('19', LPAD(CAST(year_column AS VARCHAR), 2, '0'))
             ELSE CONCAT('20', LPAD(CAST(year_column AS VARCHAR), 2, '0'))
        END,
        '-',
        LPAD(CAST(month_column AS VARCHAR), 2, '0'),
        '-',
        LPAD(CAST(day_column AS VARCHAR), 2, '0')
    ) AS date_column
FROM
    your_table_name;
