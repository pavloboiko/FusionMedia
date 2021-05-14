package FusionMedia_Android;

class MediaPlayerListener implements android.media.MediaPlayer.OnPreparedListener {
  private long _ptr;
  
  public void onPrepared(android.media.MediaPlayer mp) {
    onPreparedImpl(_ptr ,mp);
  }
  private native void onPreparedImpl(long _ptr, android.media.MediaPlayer mp);
  
}
