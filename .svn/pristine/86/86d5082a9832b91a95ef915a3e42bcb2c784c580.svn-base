package com.common.hbase;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.util.Bytes;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.hadoop.hbase.HbaseTemplate;
import org.springframework.data.hadoop.hbase.RowMapper;
import org.springframework.data.hadoop.hbase.TableCallback;
import org.springframework.stereotype.Repository;
import org.testng.log4testng.Logger;

/**
 * mongo封装
 * 
 * @author Liu Jinglei
 * 
 */
@Repository("hbaseTemplage")
public class Hbase<T> {
	private Logger logger = Logger.getLogger(Hbase.class);

	HbaseTemplate hbaseTemplate;

	@Autowired(required = false)
	private void setHbaseTemplate(
			@Qualifier("hbaseTemplate") HbaseTemplate hbaseTemplatep) {
		File workaround = new File(".");
		System.getProperties().put("hadoop.home.dir",
				workaround.getAbsolutePath());
		new File("./bin").mkdirs();
		try {
			new File("./bin/winutils.exe").createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
		}
		this.hbaseTemplate = hbaseTemplatep;
		Configuration a = hbaseTemplatep.getConfiguration();
	}

	private HbaseTemplate getHbaseTemplate() {
		return hbaseTemplate;
	}

	public Boolean execute(String tableName, TableCallback<Boolean> action) {
		return hbaseTemplate.execute(tableName, new TableCallback<Boolean>() {
			public Boolean doInTable(HTableInterface table) throws Throwable {
				boolean flag = false;
				try {
					byte[] rowkey = key.getBytes();
					Put put = new Put(rowkey);
					put.add(Bytes.toBytes(familyName),
							Bytes.toBytes(qualifier), Bytes.toBytes(value));
					table.put(put);
					flag = true;
				} catch (Exception e) {
					e.printStackTrace();
				}
				return flag;
			}
		});
	}

	public void scan(String tablename, String family, String qualifier)
			throws IOException {
		HTable hTable = new HTable(hbaseTemplate.getConfiguration(),
				tablename.getBytes());
		Scan scan = new Scan();
		scan.addColumn(family.getBytes(), qualifier.getBytes());

		ResultScanner scanner = hTable.getScanner(scan);

		for (Result result = scanner.next(); result != null; result = scanner
				.next()) {
		}
	}

	public Map<String, Object> get(String tableName, String rowName) {
		return hbaseTemplate.get(tableName, rowName,
				new RowMapper<Map<String, Object>>() {
					public Map<String, Object> mapRow(Result result, int rowNum)
							throws Exception {
						List<Cell> ceList = result.listCells();
						Map<String, Object> map = new HashMap<String, Object>();
						if (ceList != null && ceList.size() > 0) {
							for (Cell cell : ceList) {
								map.put(Bytes.toString(cell.getFamilyArray(),
										cell.getFamilyOffset(),
										cell.getFamilyLength())
										+ "_"
										+ Bytes.toString(
												cell.getQualifierArray(),
												cell.getQualifierOffset(),
												cell.getQualifierLength()),
										Bytes.toString(cell.getValueArray(),
												cell.getValueOffset(),
												cell.getValueLength()));
							}
						}
						return map;
					}
				});
	}

	public List<Map<String, Object>> find(String tableName, String startRow,
			String stopRow) {
		Scan scan = new Scan();
		if (startRow == null) {
			startRow = "";
		}
		if (stopRow == null) {
			stopRow = "";
		}
		scan.setStartRow(Bytes.toBytes(startRow));
		scan.setStopRow(Bytes.toBytes(stopRow));
		/*
		 * PageFilter filter = new PageFilter(5); scan.setFilter(filter);
		 */
		return hbaseTemplate.find(tableName, scan,
				new RowMapper<Map<String, Object>>() {
					public Map<String, Object> mapRow(Result result, int rowNum)
							throws Exception {

						List<Cell> ceList = result.listCells();
						Map<String, Object> map = new HashMap<String, Object>();
						Map<String, Map<String, Object>> returnMap = new HashMap<String, Map<String, Object>>();
						String row = "";
						if (ceList != null && ceList.size() > 0) {
							for (Cell cell : ceList) {
								row = Bytes.toString(cell.getRowArray(),
										cell.getRowOffset(),
										cell.getRowLength());
								String value = Bytes.toString(
										cell.getValueArray(),
										cell.getValueOffset(),
										cell.getValueLength());
								String family = Bytes.toString(
										cell.getFamilyArray(),
										cell.getFamilyOffset(),
										cell.getFamilyLength());
								String quali = Bytes.toString(
										cell.getQualifierArray(),
										cell.getQualifierOffset(),
										cell.getQualifierLength());
								map.put(family + "_" + quali, value);
							}
							map.put("row", row);
						}
						return map;
					}
				});
	}

	public String get(String tableName, String rowName, String familyName,
			String qualifier) {
		return hbaseTemplate.get(tableName, rowName, familyName, qualifier,
				new RowMapper<String>() {
					public String mapRow(Result result, int rowNum)
							throws Exception {
						List<Cell> ceList = result.listCells();
						String res = "";
						if (ceList != null && ceList.size() > 0) {
							for (Cell cell : ceList) {
								res = Bytes.toString(cell.getValueArray(),
										cell.getValueOffset(),
										cell.getValueLength());
							}
						}
						return res;
					}
				});
	}

	public String key;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getQualifier() {
		return qualifier;
	}

	public void setQualifier(String qualifier) {
		this.qualifier = qualifier;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String familyName;
	public String qualifier;
	public String value;

	

}
