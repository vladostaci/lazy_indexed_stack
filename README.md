# lazy_indexed_stack

LazyIndexedStack works similar to  the `IndexedStack` widget, but adds the ability to load widgets lazily and supports Fade animation when switching between widgets.

## Getting Started

依赖

```
    azy_indexed_stack: any
```

导入:
import 'package:lazy_indexed_stack/lazy_indexed_stack.dart';

使用方法：

```
LazyIndexedStack(
  reuse: false,
  index: selectedIndex,
  itemBuilder: (context, index){
    return LoadingPage();
  },
  itemCount: 4,
)
```