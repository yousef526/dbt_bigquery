{% macro dynamic_partition(column_name, interval) %}
    CASE                                    -- here INTERVAL 3 means 3 months interval
        WHEN DATE({{ column_name }}) >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 {{ interval }}) THEN 'recent'
        ELSE 'historical'
    END AS partition_group
{% endmacro %}