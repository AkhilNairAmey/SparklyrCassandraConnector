spark.hello: Scala to Spark Example
================

This is package to demonstrate how [sparklyr](http://github.com/rstudio/sparklyr) can be used to assist in building an [sparkapi](http://github.com/rstudio/sparkapi) extension package that uses Scala code, which is compiled and deployed to Apache Spark.

For instance, suppose that you need to write the following Scala code that needs to deploy to Spark:

``` scala
object HelloWorld {
  def hello() : String = {
    "Hello, world! - From Scala"
  }
}
```

Packaging and deploying this Scala code can be accomplished by following the structure of this sample package. The Scala code is stored under `inst/scala` and compiled using the follwoing command which will generate the supporting jars under `inst/java`:

``` r
sparklyr::spark_compile("SparkHello")
```

Once the code is compiled as jars, you can make use of it on your own R functions using `invoke` and `invoke_static`:

``` r
spark_hello <- function(sc) {
  sparkapi::invoke_static(sc, "SparkHello.HelloWorld", "hello")
}
```

After building this package, others using `sparklyr` will be able to use your extension as well:

``` r
library(sparklyr)
library(spark.hello)

sc <- spark_connect(master = "local")
spark_hello(sc)
```

    ## [1] "Hello, world! - From Scala"

``` r
spark_disconnect(sc)
```

You can learn more about sparklyr at: \[<http://spark.rstudio.com/>\]