part of ace.proxy;

class _VirtualRendererProxy extends HasProxy implements VirtualRenderer {
  
  get containerElement => call('getContainerElement');
  
  int get firstVisibleRow => call('getFirstVisibleRow');
  
  int get lastVisibleRow => call('getLastVisibleRow');
  
  int get lineHeight => jsProxy['lineHeight'];
  
  bool
    get fixedWidthGutter => call('getOption', ['fixedWidthGutter']);
    set fixedWidthGutter(bool fixedWidthGutter) => 
        call('setOption', ['fixedWidthGutter', fixedWidthGutter]);
  
  get mouseEventTarget => call('getMouseEventTarget');
  
  int
    get printMarginColumn => call('getPrintMarginColumn');
    set printMarginColumn(int printMarginColumn) => 
        call('setPrintMarginColumn', [printMarginColumn]);
    
  bool
    get showGutter => call('getShowGutter');
    set showGutter(bool value) => call('setShowGutter', [value]);
    
  _VirtualRendererProxy(container, _ThemeProxy theme) 
  : this._(new js.JsObject(_modules['ace/virtual_renderer'][VirtualRenderer], 
      [container, theme._theme]));
    
  _VirtualRendererProxy._(js.JsObject proxy) : super(proxy);
  
  getOption(String name) => call('getOption', [name]);
  
  Map<String, dynamic> getOptions(List<String> optionNames) =>
      _map(call('getOptions', [_jsArray(optionNames)]));
  
  void setOption(String name, value) => call('setOption', [name, value]);
  
  void setOptions(Map<String, dynamic> options) => 
      call('setOptions', [_jsify(options)]);
  
  Point textToScreenCoordinates(int row, int column) {
    final js.JsObject proxy = call('textToScreenCoordinates', [row, column]);
    return new Point(proxy['pageY'], proxy['pageX']);
  }
  
  void updateFull({bool force: false}) => call('updateFull', [force]);
}
