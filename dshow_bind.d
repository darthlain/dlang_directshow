public import core.sys.windows.windows;
public import core.sys.windows.objidl;

// evilrat666/directx-d com.dから拝借
template uuid(T, const char[] g) {
    const char [] uuid =
        "const IID IID_"~T.stringof~"={ 0x" ~ g[0..8] ~ ",0x" ~ g[9..13] ~ ",0x" ~ g[14..18] ~ ",[0x" ~ g[19..21] ~ ",0x" ~ g[21..23] ~ ",0x" ~ g[24..26] ~ ",0x" ~ g[26..28] ~ ",0x" ~ g[28..30] ~ ",0x" ~ g[30..32] ~ ",0x" ~ g[32..34] ~ ",0x" ~ g[34..36] ~ "]};"~
        "template uuidof(T:"~T.stringof~"){"~
        "    const IID uuidof ={ 0x" ~ g[0..8] ~ ",0x" ~ g[9..13] ~ ",0x" ~ g[14..18] ~ ",[0x" ~ g[19..21] ~ ",0x" ~ g[21..23] ~ ",0x" ~ g[24..26] ~ ",0x" ~ g[26..28] ~ ",0x" ~ g[28..30] ~ ",0x" ~ g[30..32] ~ ",0x" ~ g[32..34] ~ ",0x" ~ g[34..36] ~ "]};"~
        "}";
}

// oaidl.h 2306
mixin( uuid!(IDispatch, "00020400-0000-0000-C000-000000000046"));
interface IDispatch : IUnknown {
    extern(Windows):
    HRESULT GetTypeInfoCount(UINT* pctinfo);
    void f2();
    //HRESULT GetTypeInfo(UINT iTInfo, LCID lcid, ITypeInfo* ppTInfo);
    void f3();
    //HRESULT GetIDsOfNames(REFIID riid, LPOLESTR* reszNames, UINT cNames, LCID lcid, DISPID* rgDisid);
    void f4();
    //HRESULT Invoke(DISPID dispIdMember, REFIID riid, LCID lcid, WORD wFlags, DISPPARAMS* pDispParams, VARIANT* pVarResult, EXCEPINFO* pExcepInfo, UINT* puArgErr);
}

// control.h 367
mixin( uuid!(IMediaControl, "56a868b1-0ad4-11ce-b03a-0020af0ba770"));
interface IMediaControl : IDispatch {
    extern(Windows):
    HRESULT Run() const;
    HRESULT Pause();
    HRESULT Stop();
    void f4();
    HRESULT RenderFile(LPCWSTR lpcwstrFile, LPCWSTR lpcwstrPlayList = null) const;
    void f6();
    void f7();
    void f8();
    void f9();
}

// strmif.h 1790
mixin( uuid!(IFilterGraph, "56a8689f-0ad4-11ce-b03a-0020af0ba770"));
interface IFilterGraph : IUnknown {
    extern(Windows):
    HRESULT AddFilter(IBaseFilter pFilter, LPCWSTR pName);
    HRESULT RemoveFilter(IBaseFilter pFilter);
    void f3();
    void f4();
    void f5();
    void f6();
    void f7();
    void f8();
}

// strmif.h 7649
mixin( uuid!(IFilterGraph2, "36b73882-c2c8-11cf-8b46-00805f6cef60"));
interface IFilterGraph2 : IGraphBuilder {
    extern(Windows):
    void f1();
    void f2();
    HRESULT RenderEx(IPin pPinOut, DWORD dwFlags, DWORD* pvContext = null) const;
}

// strmif.h 1254
mixin( uuid!(IPin, "56a86891-0ad4-11ce-b03a-0020af0ba770"));
interface IPin : IUnknown {
    extern(Windows):
    void f1();
    void f2();
    void f3();
    HRESULT ConnectedTo(IPin* pPin);
    void f5();
    void f6();
    HRESULT QueryDirection(PIN_DIRECTION* pPinDir);
    void f8();
    void f9();
    void f10();
    void f11();
    void f12();
    void f13();
    void f14();
    void f15();
}

mixin( uuid!(IEnumPins, "56a86892-0ad4-11ce-b03a-0020af0ba770"));
interface IEnumPins : IUnknown {
    extern(Windows):
    HRESULT Next(ULONG cPins, IPin* ppPins, ULONG* pcFetched) const;
    HRESULT Skip(ULONG cPins) const;
    HRESULT Reset() const;
    HRESULT Clone(IEnumPins* ppEnum) const;
}

// strmif.h 6816
mixin( uuid!(IGraphBuilder, "56a868a9-0ad4-11ce-b03a-0020af0ba770"));
interface IGraphBuilder : IFilterGraph {
    extern(Windows):
    void f1();
    void f2();
    HRESULT RenderFile(LPCWSTR lpcwstrFile,  LPCWSTR lpcwstrPlayList = null) const;
    HRESULT AddSourceFilter(LPCWSTR lpcwstrFileName, LPCWSTR lpcwstrFilterName,
                IBaseFilter *ppFilter);
    void f5();
    void f6();
    void f7();
}

//  strmif.h 20656
mixin( uuid!(IVMRFilterConfig, "9e5530c5-7034-48b4-bb46-0b8a6efc8e36"));
interface IVMRFilterConfig : IUnknown {
    extern(Windows):
    void f1();
    void f2();
    void f3();
    void f4();
    HRESULT SetRenderingMode(DWORD Mode) const;
    void f6();
    void f7();
}

alias OAEVENT = LONG_PTR;

// control.h 589
mixin( uuid!(IMediaEvent, "56a868b6-0ad4-11ce-b03a-0020af0ba770"));
interface IMediaEvent : IDispatch {
    extern(Windows):
    HRESULT GetEventHandle(OAEVENT* hEvent);
    HRESULT GetEvent(long* lEventCode, LONG_PTR* lParam1, LONG_PTR* lParam2, long msTimeout);
    HRESULT WaitForCompletion(long msTimeout, long* pEvCode);
    HRESULT CancelDefaultHandling(long lEvCode);
    HRESULT RestoreDefaultHandling(long lEvCode);
    HRESULT FreeEventParams(long lEvCode, LONG_PTR lParam1, LONG_PTR lParam2);
}

alias OAHWND = LONG_PTR;

// control.h 794
mixin( uuid!(IMediaEventEx, "56a868c0-0ad4-11ce-b03a-0020af0ba770"));
interface IMediaEventEx : IMediaEvent {
    extern(Windows):
    HRESULT SetNotifyWindow(OAHWND hwnd, long lMsg, LONG_PTR lInstanceData);
    HRESULT SetNotifyFlags(long lNoNOtifyFlags);
    HRESULT GetNotifyFlags(long* lplNoNotifyFlags);
}

// strmif.h 2116
mixin( uuid!(IMediaFilter, "56a86899-0ad4-11ce-b03a-0020af0ba770"));
interface IMediaFilter : IPersist {
    extern(Windows):
    void f1();
    void f2();
    void f3();
    void f4();
    void f5();
    void f6();
}

// strmif.h 2284
mixin( uuid!(IBaseFilter, "56a86895-0ad4-11ce-b03a-0020af0ba770"));
interface IBaseFilter : IMediaFilter {
    extern(Windows):
    HRESULT EnumPins(IEnumPins* ppEnum);
    void f2();
    void f3();
    void f4();
    void f5();
}

mixin( uuid!(ICaptureGraphBuilder2, "93E5A4E0-2D50-11d2-ABFA-00A0C9C6E38D"));
interface ICaptureGraphBuilder2 : IUnknown {
    extern(Windows):
    HRESULT SetFiltergraph(IGraphBuilder pfg) const;
    void f2();
    void f3();
    void f4();
    void f5();
    void f6();
    void f7();
    void f8();
    void f9();
}

mixin( uuid!(IMFGetService, "fa993888-4383-415a-a930-dd472a8cf6f7"));
interface IMFGetService : IUnknown {
    extern(Windows):
    HRESULT GetService(REFGUID guidService, REFIID riid, LPVOID* ppvObject);
}

// evr.h 486
mixin( uuid!(IMFVideoDisplayControl, "a490b1e4-ab84-4d31-a1b2-181e03b1077a"));
interface IMFVideoDisplayControl : IUnknown {
    extern(Windows):
    HRESULT GetNativeVideoSize(SIZE* pszVideo, SIZE* pszARVideo);
    HRESULT GetIdealVideoSIze(SIZE* pszMin, SIZE* pszMax);
    HRESULT SetVideoPosition(const MFVideoNormalizedRect *pnrcSource, const LPRECT prcDest);
    void f4();
    HRESULT SetAspectRatioMode(DWORD dwAspectRatioMode);
    void f6();
    HRESULT SetVideoWindow(HWND hwndVideo);
    void f8();
    HRESULT RepaintVideo();
    void f10();
    void f11();
    void f12();
    void f13();
    void f14();
    void f15();
    void f16();
    void f17();
}

// strmif.h 19963
mixin( uuid!(IVMRWindowlessControl, "0eb1088c-4dcd-46f0-878f-39dae86a51b7"));
interface IVMRWindowlessControl : IUnknown {
    extern(Windows):
    void f1();
    void f2();
    void f3();
    void f4();
    void f5();
    void f6();
    void f7();
    HRESULT SetVideoClippingWindow(HWND hwnd) const;
    void f9();
    void f10();
    void f11();
    void f12();
    void f13();
    void f14();
    void f15();
}

// vmr9.h 799
mixin( uuid!(IVMRWindowlessControl9, "8f537d09-f85e-4414-b23b-502e54c79927"));
interface IVMRWindowlessControl9 : IUnknown {
    extern(Windows):
    void f1();
    void f2();
    void f3();
    void f4();
    void f5();
    void f6();
    void f7();
    void f8();
    void f9();
    void f10();
    void f11();
    void f12();
    void f13();
}

const GUID CLSID_FilterGraph = { 0xe436ebb3, 0x524f, 0x11ce,
    [0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70] };

const GUID CLSID_EnhancedVideoRenderer = { 0xfa10746c, 0x9b63, 0x4b6c,
    [0xbc, 0x49, 0xfc, 0x30, 0xe, 0xa5, 0xf2, 0x56] };

const GUID CLSID_CaptureGraphBuilder2 = { 0xBF87B6E1, 0x8C27, 0x11d0,
    [0xB3, 0xF0, 0x0, 0xAA, 0x00, 0x37, 0x61, 0xC5] };

const GUID MR_VIDEO_RENDER_SERVICE = { 0x1092a86c, 0xab1a, 0x459a,
    [0xa3, 0x36, 0x83, 0x1f, 0xbc, 0x4d, 0x11, 0xff] };

const GUID CLSID_DSoundRender = { 0x79376820, 0x07D0, 0x11CF,
    [0xA2, 0x4D, 0x0, 0x20, 0xAF, 0xD7, 0x97, 0x67] };

enum VMRMode {
    VMRMode_Windowed   = 0x1,
    VMRMode_Windowless = 0x2,
    VMRMode_Renderless = 0x4,
    VMRMode_Mask       = 0x7
}

enum AM_RENDEREX_RENDERTOEXISTINGRENDERERS = 0x1;

enum PIN_DIRECTION {
    PINDIR_INPUT = 0,
    PINDIR_OUTPUT = (PINDIR_INPUT + 1)
}

struct MFVideoNormalizedRect {
    float left;
    float top;
    float right;
    float bottom;
}

// evcode.h
enum EC_COMPLETE = 0x01;
enum EC_USERABORT = 0x02;
enum EC_ERRORABORT = 0x03;

// vfwmsg.h
enum VFW_E_WRONG_STATE = cast(HRESULT)0x80040227L;
enum VFW_E_NOT_CONNECTED = cast(HRESULT)0x80040209L;
enum VFW_E_NOT_FOUND = cast(HRESULT)0x80040216L;
enum VFW_E_CANNOT_RENDER = cast(HRESULT)0x80040218L;

// evr.h
enum MFVideoAspectRatioMode {
    MFVideoARMode_None = 0,
    MFVideoARMode_PreservePicture = 0x1,
    MFVideoARMode_PreservePixel = 0x2,
    MFVideoARMode_NonLinearStretch = 0x4,
    MFVideoARMode_Mask = 0x7
}
