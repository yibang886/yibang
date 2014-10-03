package com.common.upload;

import java.io.File;

public class ReceivedFile
{
  private File file;
  private String suffix;
  private String descrip;

  public ReceivedFile(File file, String suffix, String descrip)
  {
    this.file = file;
    this.suffix = suffix;
    this.descrip = descrip;
  }

  public File getFile()
  {
    return file;
  }
  public void setFile(File file)
  {
    this.file = file;
  }

  public String getSuffix()
  {
    return suffix;
  }
  public void setSuffix(String suffix)
  {
    this.suffix = suffix;
  }

  public String getDescrip()
  {
    return descrip;
  }
  public void setDescrip(String descrip)
  {
    this.descrip = descrip;
  }
}
