/*List the countries ranked 10-12 in each continent by the percent of year-over-year growth descending from 2011 to 2012.

The percent of growth should be calculated as: ((2012 gdp - 2011 gdp) / 2011 gdp)

The list should include the columns:

- rank
- continent_name
- country_code
- country_name
- growth_percent
*/
select
  *
from
  (
    select
      row_number() over (
        partition by continent_name
        order by
          (gdp_2012 - gdp_2011) * 100.00 / gdp_2011 desc
      ) as rank,
      continent_name,
      country_code,
      country_name,
      concat(
        round(
          ((gdp_2012 - gdp_2011) * 100.00 / gdp_2011) :: numeric,
          2
        ),
        '%'
      ) as growth_percent
    from
      (
        select
          per_capita.country_code,
          cs.continent_name,
          ct.country_name,
          case
            when year = 2011 then gdp_per_capita
            else null
          end as gdp_2011,
          gdp_2012.gdp_2012
        from
          per_capita
          join continent_map c on c.country_code = per_capita.country_code
          join continents cs on cs.continent_code = c.continent_code
          join countries ct on ct.country_code = per_capita.country_code
          join (
            select
              country_code,
              case
                when year = 2012 then gdp_per_capita
                else null
              end as gdp_2012
            from
              per_capita
            where
              year = 2012
              and gdp_per_capita is not null
          ) gdp_2012 on gdp_2012.country_code = per_capita.country_code
        where
          year = 2011
          and gdp_per_capita is not null
      ) sub
  ) sub_2
where
  rank between 10
  and 12