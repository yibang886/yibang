package com.common.upload;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UploadUtil
{
  private static DiskFileItemFactory factory = null;
  private static ServletFileUpload upload = null;

  private static int SIZE_THRESHOLD = 5*1024*1024;
  private static int MAX_SIZE = 5*1024*1024;

  private static final Logger logger = LoggerFactory.getLogger(UploadUtil.class);

  static 
  {
    factory = new DiskFileItemFactory();
    factory.setSizeThreshold(SIZE_THRESHOLD);
    factory.setRepository(new File("/var/www/"));

    upload = new ServletFileUpload(factory);
    upload.setSizeMax(MAX_SIZE);
  }

  public static ReceivedData receive(HttpServletRequest request, boolean skipText, boolean skipFile, String filePath, String pre_suffix)
  {
    String contentType = request.getContentType();
    logger.debug("contentType="+contentType);

    if(contentType.indexOf("multipart/form-data") < 0)
    {
      logger.error("Invalid content type: " + contentType);
      return null;
    }

    if(!skipFile)
    {
      File folder = new File(filePath);
  
      if(folder.exists()&&folder.isFile())
      {
        folder.delete();
      }
  
      if(!folder.exists())
      {
        folder.mkdirs();
      }
    }

    try
    {
      List fileItems = upload.parseRequest(request);

      List<ReceivedFile> fileList = new ArrayList<ReceivedFile>();
      Map<String,String> textMap = new TreeMap<String,String>();
      ReceivedData receivedData = new ReceivedData(); 

      for ( int k=0; k<fileItems.size(); k++)
      {
        FileItem fi = (FileItem)fileItems.get(k);

        if ( fi.isFormField () ) //ordinary field of form, instead of a file; because the "enctype" of from is "multipart/form-data"
                                 //we cannot recive ordinary fields in normal way anymore; thus we have to receive by FileItem;
        {
          if(skipText)
          {
            logger.info("Skip receiving ordinary fields ...");
          }
          else
          {
            String fieldName = fi.getFieldName();
            String fieldValue = fi.getString();
            logger.debug("Received ordinary field: ("+ fieldName + ":" + fieldValue+")");
            if(fieldName!=null&&!fieldName.trim().equals("")&&fieldValue!=null&&!fieldValue.trim().equals(""))
            {
              textMap.put(fieldName,fieldValue);
            }
          }
        }
        else // file field
        {
          if(skipFile)
          {
            logger.info("Skip receiving files ...");
          }
          else
          {
            String fileName = fi.getName();
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            suffix = pre_suffix + suffix;
  
            logger.debug("Receving file: name="+fileName+", suffix="+suffix+"...");
  
            String saveName = "raw"+suffix;
  
            File file = new File(filePath, saveName);
            
            fi.write( file );
  
            fileList.add(new ReceivedFile(file, suffix, "Original name:"+fileName));
          }
        }
      }

      receivedData.setFileList(fileList);
      receivedData.setTextMap(textMap);
      return receivedData;
    }
    catch(Throwable ex)
    {
      logger.error("unknown exception caught");
      ex.printStackTrace();
      return null;
    }
  }
}
