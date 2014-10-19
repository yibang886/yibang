package com.common.upload;

import java.util.List;
import java.util.Map;

public class ReceivedData
{
  private List<ReceivedFile> fileList;
  private Map<String,String> textMap; 

  public ReceivedData()
  {
    fileList = null;
    textMap = null;
  }

  public ReceivedData(List<ReceivedFile> fileList, Map<String,String> textMap)
  {
    this.fileList = fileList;
    this.textMap = textMap;
  }

  public void setFileList(List<ReceivedFile> fileList)
  {
    this.fileList = fileList;
  }
  public List<ReceivedFile> getFileList()
  {
    return this.fileList;
  }

  public void setTextMap(Map<String,String> textMap)
  {
    this.textMap = textMap;
  }
  public Map<String,String> getTextMap()
  {
    return this.textMap;
  }
}
