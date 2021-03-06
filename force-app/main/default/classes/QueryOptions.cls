/**
 * @File Name          : QueryOptions.cls
 * @Description        : Query options that are fed into database queries
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/27/2020, 12:13:15 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class QueryOptions implements IQueryOptions {

    @TestVisible
    private ISelector primarySelector;
    @TestVisible
    private ISoqlCondition condition;
    @TestVisible
    private Integer offset; 
    @TestVisible 
    private List<CrossObjectQueryOptions> crossObjectQueries {
        get {
            if (this.crossObjectQueries == null) this.crossObjectQueries = new List<CrossObjectQueryOptions>();
            return this.crossObjectQueries;
        } set;
    }
    @TestVisible
    private List<RelatedListQueryOptions> relatedListQueries {
        get {
            if (this.relatedListQueries == null) this.relatedListQueries = new List<RelatedListQueryOptions>();
            return this.relatedListQueries;
        } set;
    }

    public QueryOptions setPrimarySelector(ISelector primarySelector) {
        this.primarySelector = primarySelector;
        return this;
    }

    public QueryOptions addCrossObjectQuery(CrossObjectQueryOptions crossObjectQueryOptions) {
        this.crossObjectQueries.add(crossObjectQueryOptions);
        return this;
    }

    public QueryOptions clearCrossObjectQueries() {
        this.crossObjectQueries.clear();
        return this;
    }

    public QueryOptions addRelatedListQuery(RelatedListQueryOptions relatedListQueryOptions) {
        this.relatedListQueries.add(relatedListQueryOptions);
        return this;
    }

    public QueryOptions clearRelatedListQueries() {
        this.relatedListQueries.clear();
        return this;
    }

    public QueryOptions setSoqlCondition(ISoqlCondition condition) {
        this.condition = condition;
        return this;
    }

    public String toSoql() {
        return '';
    }
}
