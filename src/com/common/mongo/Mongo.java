package com.common.mongo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.geo.Distance;
import org.springframework.data.geo.GeoResult;
import org.springframework.data.geo.Point;
import org.springframework.data.mongodb.core.FindAndModifyOptions;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.TypedAggregation;
import org.springframework.data.mongodb.core.geo.GeoResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.NearQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;
import org.testng.log4testng.Logger;

import com.common.tag.PageIterator;
import com.mongodb.BasicDBObject;
import com.mongodb.WriteResult;

/**
 * mongo封装
 * @author Liu Jinglei 
 *
 */
@Repository("mongoTemplage")
public class Mongo<T> {
	private Logger logger = Logger.getLogger(Mongo.class);

	private MongoTemplate mongoTemplate;
	// 翻页设置，每页显示行数
	@Value("${pagesize}")
	private int pageSize;

	@Autowired(required = false)
	private void setMongoTemplate(@Qualifier("mongoTemplateZyky") MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	private MongoTemplate getMongoTemplate() {
		return mongoTemplate;
	}

	public int count(Query query, Class entityClass) {
		return (int) mongoTemplate.count(query, entityClass);
	}

	public Object eval(String function){
		return this.mongoTemplate.getDb().eval(function);
	}
	public PageIterator queryListPageDefault(Query query, int start, Class entityClass) {
		return queryListPage(query, start, pageSize, entityClass);
	}

	public PageIterator queryListPage(Query query, int start, int count, Class entityClass) {
		PageIterator pageinfo = null;
		int totalCount = this.count(query, entityClass);

		query.skip(start).limit(count);
		List<T> rows = this.find(query, entityClass);

		pageinfo = new PageIterator(totalCount, rows, start, count, true);
		return pageinfo;
	}

	public List<T> queryListSkip(Query query, int start, int count, Class entityClass) {
		query.skip(start).limit(count);
		List<T> rows = this.find(query, entityClass);
		return rows;
	}

	public T update(Query query, Update update, Class entityClass) {
		return (T) mongoTemplate.findAndModify(query, update, entityClass);
	}

	public WriteResult updateMulti(Query query, Update update, Class entityClass) {
		WriteResult wr = mongoTemplate.updateMulti(query, update, entityClass);
		return wr;
	}

	public T findOne(Query query, Class entityClass) {
		return (T) mongoTemplate.findOne(query, entityClass);
	}

	public T findById(ObjectId _id, Class entityClass) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(_id));
		return (T) mongoTemplate.findOne(query, entityClass);
	}

	public List<T> find(Query query, Class entityClass) {
		return mongoTemplate.find(query, entityClass);
	}
	
	public GeoResults<T> findNear(Point point,Distance distance,Class entityClass) {
		
		return mongoTemplate.geoNear(NearQuery.near(point).maxDistance(distance), entityClass);	
	}

	public List<T> findAll(Class entityClass) {
		return mongoTemplate.findAll(entityClass);
	}

	public List<T> group(TypedAggregation<T> agg, Class entityClass) {
		AggregationResults<T> result = mongoTemplate.aggregate(agg, entityClass);
		List<T> list = result.getMappedResults();
		return list;
	}
	
	
	public void groupBy(Aggregation agg, String collectionName, Class entityClass) {
		//AggregationResults<T> result = mongoTemplate.aggregate(agg,collectionName, entityClass); 
		AggregationResults<BasicDBObject> result = mongoTemplate.aggregate(agg,collectionName, entityClass);  
		List<BasicDBObject> list = result.getMappedResults();
		for (BasicDBObject dbo : list) {  
	            System.out.println(dbo.getInt("total"));
	    }
		
		// AggregationResults<BasicDBObject> result = mongoTemplate.aggregate(agg, BasicDBObject.class);
		
	}

	public List<T> group(TypedAggregation<T> agg, String collectionName, Class entityClass) {
		AggregationResults<T> result = mongoTemplate.aggregate(agg, collectionName, entityClass);
		List<T> list = result.getMappedResults();
		return list;
	}

	public void insert(T entity) {
		mongoTemplate.insert(entity);
	}

	public void batchInsert(List<T> list) {
		mongoTemplate.insertAll(list);
	}

	public WriteResult delete(Query query, Class entityClass) {
		WriteResult wr = mongoTemplate.remove(query, entityClass);
		return wr;
	}

	public WriteResult upsert(Query query, Update update, Class entityClass) {
		return mongoTemplate.upsert(query, update, entityClass);
	}

	public T findAndModify(Query query, Update update, Class<T> entityClass) {
		return mongoTemplate.findAndModify(query, update, new FindAndModifyOptions().returnNew(true), entityClass);
	}

}
