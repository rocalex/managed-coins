# Managed coins

## Deploy contract

```
aptos init
aptos move publish
```

## Init Receivers

```
aptos init --profile receiver1
aptos init --profile receiver2
```

## Mint HUGO

```
aptos move run --function-id default::managed_coins::register_hugo --profile receiver1
aptos move run --function-id default::managed_coins::register_hugo --profile receiver2
aptos move run --function-id default::managed_coins::mint_hugo --args address:receiver1 u64:7000
aptos move run --function-id default::managed_coins::mint_hugo --args address:receiver2 u64:2000
```

## Mint BATI

```
aptos move run --function-id default::managed_coins::register_bati --profile receiver1
aptos move run --function-id default::managed_coins::register_bati --profile receiver2
aptos move run --function-id default::managed_coins::mint_bati --args address:receiver1 u64:3000
aptos move run --function-id default::managed_coins::mint_bati --args address:receiver2 u64:5000
```