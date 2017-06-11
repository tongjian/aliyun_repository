package com.runzhen.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.poi.hpsf.SummaryInformation;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFComment;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

import com.runzhen.excel.domain.ExcelConfigInfo;

public class ExcelUtil {

	public String NO_DEFINE = "no_define";				//未定义的字段
    public String DEFAULT_DATE_PATTERN="yyyy-MM-dd hh:mm:ss";		//日期格式
    public int DEFAULT_COLOUMN_WIDTH = 17;
    private int colWidth = 0;							//列宽度
    private String title = "测试表头";								//表头标题行
    
    /**
     * 初始化工作簿
    */
    public void initWorkbook(HSSFWorkbook workbook){
    	 workbook.createInformationProperties();
         workbook.getDocumentSummaryInformation().setCompany("*****公司");
         SummaryInformation si = workbook.getSummaryInformation();
         si.setAuthor("JACK");  //填加xls文件作者信息
         si.setApplicationName("导出程序"); //填加xls文件创建程序信息
         si.setLastAuthor("最后保存者信息"); //填加xls文件最后保存者信息
         si.setComments("JACK is a programmer!"); //填加xls文件作者信息
         si.setTitle("POI导出Excel"); //填加xls文件标题信息
         si.setSubject("POI导出Excel");//填加文件主题信息
         si.setCreateDateTime(new Date());
    }
    
    /**
     * 设置表头样式
    */
    @SuppressWarnings("deprecation")
	public HSSFCellStyle initTitleStyle(HSSFWorkbook workbook){
        HSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont titleFont = workbook.createFont();
        titleFont.setFontHeightInPoints((short) 20);
        titleFont.setBoldweight((short) 700);
        titleStyle.setFont(titleFont);
        
        return titleStyle;
    }
    
    /**
     * 设置列头样式
    */
    @SuppressWarnings("deprecation")
	public HSSFCellStyle initHeaderStyle(HSSFWorkbook workbook){
        HSSFCellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont headerFont = workbook.createFont();
        headerFont.setFontHeightInPoints((short) 12);
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerStyle.setFont(headerFont);
        
        return headerStyle;
    }
    
    /**
     * 设置单元格样式
    */
    @SuppressWarnings("deprecation")
	public HSSFCellStyle initCellStyle(HSSFWorkbook workbook){
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont cellFont = workbook.createFont();
        cellFont.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        cellStyle.setFont(cellFont);
        
        return cellStyle;
    }
    
    /**
     * 设置注释样式
    */
    public void initPatriarch(HSSFSheet sheet){
    	// 声明一个画图的顶级管理器
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("JACK");
    }
    
    /**
     * 初始化列宽度
    */
    public void initColWidth(HSSFSheet sheet,String[] colNames){
    	//设置列宽
        int minBytes = colWidth < DEFAULT_COLOUMN_WIDTH ? DEFAULT_COLOUMN_WIDTH : colWidth;//至少字节数
        int[] arrColWidth = new int[colNames.length];
        // 产生表格标题行,以及设置列宽
        int ii = 0;
        for (int i=0;i<arrColWidth.length;i++) {
            String fieldName = colNames[i];

            int bytes = fieldName.getBytes().length;
            arrColWidth[ii] =  bytes < minBytes ? minBytes : bytes;
            sheet.setColumnWidth(ii,arrColWidth[ii]*256);
            ii++;
        }
    }
    
    /**
     * 设置表头
     * @param colSize 列数 
    */
    public int setTitleRow(HSSFSheet sheet,HSSFCellStyle titleStyle,int colSize,int rowIndex){
    	HSSFRow titleRow = sheet.createRow(rowIndex);			//表头 rowIndex=0
        titleRow.createCell(0).setCellValue(title);
        titleRow.getCell(0).setCellStyle(titleStyle);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, colSize - 1));
        
        rowIndex++;
        return rowIndex;
    }
    
    /**
     * 设置列头
     * @param attributes 保存需要导出的对应JavaBean属性名
     * @param colNames 保存attributes属性对应显示的列名称
    */
    public int setHeaderRow(HSSFSheet sheet,String[] colNames,HSSFCellStyle headerStyle,int rowIndex){
    	HSSFRow headerRow = sheet.createRow(rowIndex); 			//列头 rowIndex =1
        for(int i=0;i<colNames.length;i++){
            headerRow.createCell(i).setCellValue(colNames[i]);
            headerRow.getCell(i).setCellStyle(headerStyle);
        }
        
        rowIndex++;
        return rowIndex;
    }
    
    /**
     * 导出Excel 97(.xls)格式 ，少量数据
     * @param attributes 保存需要导出的对应JavaBean属性名
     * @param colNames 保存attributes属性对应显示的列名称
     * @param headMap 属性-列名
     * @param jsonArray 数据集
     * @param datePattern 日期格式，null则用默认日期格式
     * @param colWidth 列宽 默认 至少17个字节
     * @param out 输出流
     * @throws Exception 
     */
    public void exportExcel(String[] attributes,String[] colNames,List<Map<String,Object>> dataList, OutputStream out) throws Exception {
        HSSFWorkbook workbook = new HSSFWorkbook();					// 声明一个工作薄
       
        initWorkbook(workbook);										//设置工作簿信息
        
        HSSFCellStyle titleStyle = initTitleStyle(workbook);		//设置表头样式
        
        HSSFCellStyle headerStyle = initHeaderStyle(workbook);		//设置列头样式
        
        HSSFCellStyle cellStyle = initCellStyle(workbook);			//设置单元格样式
        		
        HSSFSheet sheet = workbook.createSheet();					// 生成一个(带标题)表格
       
        initPatriarch(sheet);										//添加注释
        
        initColWidth(sheet,colNames);								//初始化列宽度
        
        // 遍历集合数据，产生数据行
        int rowIndex = 0;
        for(Map<String,Object> dataMap : dataList){
            if(rowIndex == 65535 || rowIndex == 0){
                if ( rowIndex == 65535) {
                	rowIndex = 0;							//rowIndex==65535则还原为0
                	sheet = workbook.createSheet();			//如果数据超过了，则在第二页显示
                }

                rowIndex = setTitleRow(sheet,titleStyle,colNames.length,rowIndex);			//设置表头
                
                rowIndex = setHeaderRow(sheet,colNames,headerStyle,rowIndex);				//设置列头
            }
            
            HSSFRow dataRow = sheet.createRow(rowIndex);				//添加数据行
            for (int i = 0; i < attributes.length; i++)
            {
                HSSFCell newCell = dataRow.createCell(i);				//添加列数据

                Object o =  dataMap.get(attributes[i]);
                String cellValue = ""; 
                if(o==null) cellValue = "";
                else if(o instanceof Date) cellValue = new SimpleDateFormat(DEFAULT_DATE_PATTERN).format(o);
                else cellValue = o.toString();

                newCell.setCellValue(cellValue);
                newCell.setCellStyle(cellStyle);
            }
            rowIndex++;
        }
        // 自动调整宽度
        /*for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }*/
        
        workbook.write(out);
        workbook.close();
    }
    
    /**
     * @param title 
     * @throws Exception 
    */
    public void downloadExcelFile(String fileName,String[] attributes,String[] colNames,List<Map<String,Object>> dataList,HttpServletResponse response) throws Exception{
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        this.exportExcel(attributes,colNames,dataList,os);
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"); 
        response.setHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes(), "iso-8859-1"));
        response.setContentLength(content.length);
        ServletOutputStream outputStream = response.getOutputStream();
        BufferedInputStream bis = new BufferedInputStream(is);
        BufferedOutputStream bos = new BufferedOutputStream(outputStream);
        byte[] buff = new byte[8192];
        int bytesRead;
        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
            bos.write(buff, 0, bytesRead);

        }
        bis.close();
        bos.close();
        outputStream.flush();
        outputStream.close();
    }

    /**
     * 导出excel文件
     * @throws Exception 
     */
    public void exportExcelFile(String fileName,List<ExcelConfigInfo> excelConfigList,List<Map<String,Object>> dataList,HttpServletResponse response) throws Exception{
    	
    	if(CollectionUtils.isEmpty(excelConfigList)){
    		throw new Exception("没有配置要导出的列.");
    	}
    	
    	int excelConfigSize = excelConfigList.size();
    	String[] attributes = new String[excelConfigSize];
    	String[] colNames = new String[excelConfigSize];
    	for(int i=0;i<excelConfigSize;i++){	
    		ExcelConfigInfo info = excelConfigList.get(i);
    		attributes[i] = info.getTitleCode();		//excel列对应导出的属性
    		colNames[i] = info.getTitleName();			//excel列名称
    	}
    	
    	this.validateAttribute(attributes, dataList);		//验证要导出的属性是否存在
    	
    	//导出excel数据
    	this.downloadExcelFile(fileName, attributes, colNames, dataList, response);
    }
    
    /**
     * 验证后台配置的要导出的列是否都存在
     * @throws Exception 
     */
    public void validateAttribute(String[] attributes,List<Map<String,Object>> dataList) throws Exception{
    	if(CollectionUtils.isNotEmpty(dataList)){
    		Map<String,Object> data = dataList.get(0);				//获取任一行记录进行验证
    		for(String excelAttr : attributes){
    			boolean isExists = false;
    			for(String dataKey : data.keySet()){
    				if(dataKey.equalsIgnoreCase(excelAttr)){
    					isExists = true;
    				}
    			}
    			
    			if(!isExists){			//说明这个属性不存在，无法导出
    				System.out.println("tj:"+"属性'"+excelAttr+"'不存在,无法导出.");
    				throw new Exception("属性'"+excelAttr+"'不存在,无法导出.");
    			}
    		}
    	}
    }
}
