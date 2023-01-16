with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('stg_payments') }}

),

final as (

    select
        payment_id,
        order_id,
        payment_method,
        amount / 100 as amount

    from source

)

select * from final

