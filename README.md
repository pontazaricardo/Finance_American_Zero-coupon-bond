# Finance_American_Zero-coupon-bond

This program calculates the price of a *x*-year American-style (put or call) option on a zero-coupon bond that matures at year *y* with a par value of 1 dollar.

![demo](/images/call/call-gif.gif)

## INPUTS AND OUTPUTS
1. **Inputs:** *x* (year), *y* (year), *r* (%) (initial short rate), *betta* (%) and *mu* (%), *sigma* (%) and number of partitions during the option's life *n*, and strike price *X* (% of par).
2. **Output:** Price of the put or the call.

## NOTES

The folder *Main* includes two files:
1.	*American_zero_coupon_put.m*
2.	*American_zero_coupon_call.m*
Run the one you need for calculating a put or call price.

## USAGE
In MatLab, just run the given files.

## EXAMPLE
Suppose *x* = 1, *y* = 2, *r* = 4 (%), *betta* = 20 (%), *mu* = 4 (%), *sigma* = 10 (%), *n* = 30 and *X* = 90 (%). The price of a call is 5.87267 and for the put is 0.0167024.