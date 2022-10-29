# mew-wallet-ios-logger

Usage example:

```
import mew_wallet_ios_logger
import os

extension Logger.System {
  public static var restNetworkClient = Logger.System.with(subsystem: "com.myetherwallet.mew-wallet-ios-networkling", category: "REST network client")
}
```

To change logging level:

```
Logger.System.restNetworkClient.level(.debug)
```
