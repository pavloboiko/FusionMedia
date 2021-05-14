#if os(Android)

import Java
import AndroidMedia

@_silgen_name("Java_FusionMedia_1Android_MediaPlayerListener_onPreparedImpl")
public func MediaPlayerListener_onPreparedImpl(env: UnsafeMutablePointer<JNIEnv>, obj: JavaObject?, ptr: JavaLong, mp: JavaObject?) -> Void {
  let _obj = unsafeBitCast(Int(truncatingIfNeeded:ptr), to: MediaPlayerListener.self)
  
  let _mp = MediaPlayer?.fromJavaObject(mp)
  
  _obj.onPrepared(mp: _mp)
}

#endif
