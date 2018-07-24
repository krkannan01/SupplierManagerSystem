package cn.xt.sms.service.middle.impl;

import cn.xt.sms.condition.ProductCondition;
import cn.xt.sms.result.MyResult;
import cn.xt.sms.entity.*;
import cn.xt.sms.exception.NullCellValueException;
import cn.xt.sms.service.*;
import cn.xt.sms.service.middle.IProductMiddleService;
import cn.xt.sms.util.POIUtil;
import lombok.extern.log4j.Log4j;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

import static org.fusesource.jansi.Ansi.ansi;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/6
 */
@Log4j
@Service
public class ProductMiddleServiceImpl implements IProductMiddleService {

    @Autowired
    private IProductService productService;
    @Autowired
    private IEnterpriseService enterpriseService;

    @Override
    public String getProductFormExcel(ServletContext context, Sheet sheet) {
        int index = 0;
        List<Product> productList = new ArrayList<Product>();
        for (Row row: sheet) {
            if (row.getRowNum() == 0) continue;
            index++;
            int pointer = 1;
            System.out.println("\n" + ansi().eraseScreen().render("@|blue --------\t正在读取第"+ index +"条记录\t--------|@"));
            Product product = null;
            try {
                // 产品名称 (String)
                String name = POIUtil.getStringValue(row.getCell(pointer++), "产品名称");
                // 产品规格 (String)
                String size = POIUtil.getStringValue(row.getCell(pointer++));
                // 产品品牌 (String)
                String brand = POIUtil.getStringValue(row.getCell(pointer++));
                // 产品单位 (String)
                String unit = POIUtil.getStringValue(row.getCell(pointer++), "产品单位");
                // 产品单价 (Float)
                Float unitprise = POIUtil.getFloatValue(row.getCell(pointer++), "产品单价");
                // 技术参数 (String)
                String technicalParam = POIUtil.getStringValue(row.getCell(pointer++));
                // 备注 (String)
                String comment = POIUtil.getStringValue(row.getCell(pointer++));
                // 供应商 (String)
                String enterprise = POIUtil.getStringValue(row.getCell(pointer++), "供应商");
                // 产品分组 (String)
                String group = POIUtil.getStringValue(row.getCell(pointer++), "产品分组");

                product = new Product();

                product.setName(name);
                product.setSize(size);
                product.setBrandId(new ProductBrand(brand));
                product.setUnit(unit);
                product.setUnitprice(unitprise);
                product.setTechnicalParam(technicalParam);
                product.setComment(comment);
                product.setSupplierId(new Supplier(enterprise));
                product.setGroupId(new ProductGroup(group));

                System.out.println(ansi().eraseScreen().render("@|green --------\t信息读取成功\t--------|@"));

            } catch (NullCellValueException ncve) {
                System.out.println(ansi().eraseScreen().render("@|red --------\t信息读取失败:\t" + ncve.getMessage() + "\t--------|@"));
                continue;
            }

            productList.add(product);
        }
        int success = 0, conflict = 0;
        for (Product product : productList) {
            try {
                //判断供应商是否存在
                Integer enterpriseId = enterpriseService.getIdByFullName(product.getSupplierId().getFullName());
                if (enterpriseId != null) {
                    product.getSupplierId().setId(enterpriseId);
                    //根据名称与供应商判断是否重复
                    if (!productService.isUnique(product)) {
                        productService.insertFromExcelProduct(context, product);
                        success++;
                    } else {
                        System.out.println(ansi().eraseScreen().render("\n@|red \t材料名称与供应商都重复，跳过此行!\t\n"));
                        conflict++;
                        continue;
                    }
                } else {
                    System.out.println(ansi().eraseScreen().render("\n@|red \t没有指定的供应商，跳过此行!\t\n"));
                    continue;
                }
            } catch (Exception e) {
                log.error("插入材料信息出现异常!\t" + e.getMessage());
                continue;
            }
        }
        return "解析完成\n共"+index+"条记录\n成功"+success+"条记录\n名称冲突"+conflict+"条记录\n未知供应商"+(productList.size()-success-conflict)+"条记录\n信息不全"+(index-productList.size())+"条记录";
    }

    @Override
    public void setProductToExcel(Workbook wb, Integer start, Integer end, ProductCondition productCondition) {
        Sheet sheet = wb.createSheet("材料信息");

        int rowPointer = 0;
        Row row = sheet.createRow(rowPointer++);

        row.setHeightInPoints(25.5f); //设置行高

        String[] columns = {"NO", "产品名称", "产品规格", "产品品牌", "产品单位", "产品单价", "技术参数", "备注", "供应商", "产品分组"};

        int[] tags = {0, 1, 2, 2, 1, 1, 2, 2, 1, 1};

        POIUtil util = new POIUtil(wb);
        for (int i = 0; i < columns.length; i++) {
            row.createCell(i).setCellValue(columns[i]);
            row.getCell(i).setCellStyle(util.styles[tags[i]]);
        }

        int pageSize = 100;
        int offset = start-1;
        while (offset < end) {
            if ((offset + pageSize) > end) {
                pageSize = end - offset;
            }

            MyResult<Product> productResult = productService.getProductList(productCondition, offset, pageSize);
            offset += pageSize;

            if (productResult.getRows() != null && productResult.getRows().size() > 0) {
                for (Product product : productResult.getRows()) {
                    row = sheet.createRow(rowPointer++);
                    row.setHeightInPoints(18.5f); //设置行高
                    int cellPointer = 0;

                    row.createCell(cellPointer++).setCellValue(rowPointer-1);
                    row.createCell(cellPointer++).setCellValue(product.getName());
                    row.createCell(cellPointer++).setCellValue(product.getSize());
                    if (product.getBrandId() != null)
                        row.createCell(cellPointer++).setCellValue(product.getBrandId().getName());
                    row.createCell(cellPointer++).setCellValue(product.getUnit());
                    row.createCell(cellPointer++).setCellValue(product.getUnitprice());
                    row.createCell(cellPointer++).setCellValue(product.getTechnicalParam());
                    row.createCell(cellPointer++).setCellValue(product.getComment());
                    row.createCell(cellPointer++).setCellValue(product.getSupplierId().getFullName());
                    row.createCell(cellPointer++).setCellValue(product.getGroupId().getName());
                }
            }
        }

    }

    @Override
    public String multiDeleteProduct(String ids) {
        String[] temp = ids.split(",");
        Integer id = null;
        for (int i=0; i<temp.length; i++) {
            try {
                id = Integer.valueOf(temp[i]);
                productService.deleteProduct(id);
            } catch(Exception e) {
                log.error("删除材料信息出现异常!\t" + e.getMessage());
                continue;
            }
        }
        return "success";
    }

}
