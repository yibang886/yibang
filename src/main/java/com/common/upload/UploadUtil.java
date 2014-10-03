package com.common.upload;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadUtil
{
  private static DiskFileItemFactory factory = null;
  private static ServletFileUpload upload = null;

  private static int SIZE_THRESHOLD = 5*1024*1024;
  private static int MAX_SIZE = 5*1024*1024;

  static 
  {
    factory = new DiskFileItemFactory();
    factory.setSizeThreshold(SIZE_THRESHOLD);
    factory.setRepository(new File("/var/www/"));

    upload = new ServletFileUpload(factory);
    upload.setSizeMax(MAX_SIZE);
  }

  public static List<ReceivedFile> receive(HttpServletRequest request, String filePath)
  {
    String contentType = request.getContentType();
    System.out.println("Yuanguo: contentType="+contentType);

    if(contentType.indexOf("multipart/form-data") < 0)
    {
      //TODO: throw exception
      System.out.println("Yuanguo: Invalid content type: "+ contentType);
      return null;
    }

    File folder = new File(filePath);
    if(!folder.exists())
    {
      System.out.println("Yuanguo: Folder("+filePath+") does NOT exist, create it!");
      folder.mkdirs();
    }

    try
    {
      List fileItems = upload.parseRequest(request);

      List<ReceivedFile> results = new ArrayList<ReceivedFile>();

      for ( int k=0; k<fileItems.size(); k++)
      {
        FileItem fi = (FileItem)fileItems.get(k);
        if ( !fi.isFormField () )
        {
          String fileName = fi.getName();
          String suffix = fileName.substring(fileName.lastIndexOf("."));

          //TODO: log
          System.out.println("Yuanguo: fileName="+fileName+", suffix="+suffix);

          String saveName = "raw"+suffix;

          File file = new File(filePath, saveName);
          
          fi.write( file );

          results.add(new ReceivedFile(file, suffix, "Original name:"+fileName));
        }
      }
      return results;
    }
    catch(Throwable ex)
    {
      System.out.println("Yuanguo: exception in UploadUtil.receive()");
      ex.printStackTrace();
      return null;
    }
  }
}
