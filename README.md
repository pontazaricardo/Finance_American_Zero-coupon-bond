# Finance_American_Zero-coupon-bond

This program calculates the price of a *x*-year American-style (put or call) option on a zero-coupon bond that matures at year *y* with a par value of 1 dollar. There are two files, one for calculating the put and the second one for the call.

![demo](/images/call/call-gif.gif)

## Inputs and outputs
1. **Inputs:** *x* (year), *y* (year), *r* (%) (initial short rate), *betta* (%) and *mu* (%), *sigma* (%) and number of partitions during the option's life *n*, and strike price *X* (% of par).
2. **Output:** Price of the put or the call (depending on the selected file).

## Notes

The folder *Main* includes two files:
1.	*American_zero_coupon_put.m*
2.	*American_zero_coupon_call.m*

Just run the file you need for calculating a put or call price.

## Execution
In MatLab, just run the given files.

## Example

### Put

Suppose *x* = 1, *y* = 2, *r* = 4(%), *betta* = 20(%), *mu* = 4(%), *sigma* = 10(%), *n* = 30 and *X* = 90(%). The price of the put is 0.0167024.

![demo](/images/put/put-gif.gif)

### Call

Again, suppose that *x* = 1, *y* = 2, *r* = 4(%), *betta* = 20(%), *mu* = 4(%), *sigma* = 10(%), *n* = 30 and *X* = 90(%). The price of a call is 5.87267.

![demo](/images/call/call-gif.gif)