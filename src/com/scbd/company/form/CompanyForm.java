package com.scbd.company.form;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias(value = "Company")
public class CompanyForm {
	int  id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAerospace_address() {
		return aerospace_address;
	}
	public void setAerospace_address(String aerospace_address) {
		this.aerospace_address = aerospace_address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getVision() {
		return vision;
	}
	public void setVision(String vision) {
		this.vision = vision;
	}
	public String getMission() {
		return mission;
	}
	public void setMission(String mission) {
		this.mission = mission;
	}
	public String getObjective() {
		return objective;
	}
	public void setObjective(String objective) {
		this.objective = objective;
	}
	public String getBusiness_description() {
		return business_description;
	}
	public void setBusiness_description(String business_description) {
		this.business_description = business_description;
	}
	public String getCompetitor() {
		return competitor;
	}
	public void setCompetitor(String competitor) {
		this.competitor = competitor;
	}
	public String getAdvantage() {
		return advantage;
	}
	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}
	public String getAnnual_report() {
		return annual_report;
	}
	public void setAnnual_report(String annual_report) {
		this.annual_report = annual_report;
	}
	public String getPartners() {
		return partners;
	}
	public void setPartners(String partners) {
		this.partners = partners;
	}
	public String getRepair() {
		return repair;
	}
	public void setRepair(String repair) {
		this.repair = repair;
	}
	public String getSpare_support() {
		return spare_support;
	}
	public void setSpare_support(String spare_support) {
		this.spare_support = spare_support;
	}
	public String getInvestment() {
		return investment;
	}
	public void setInvestment(String investment) {
		this.investment = investment;
	}
	public String getProfit_ratio() {
		return profit_ratio;
	}
	public void setProfit_ratio(String profit_ratio) {
		this.profit_ratio = profit_ratio;
	}
	public String getRevenues_growth() {
		return revenues_growth;
	}
	public void setRevenues_growth(String revenues_growth) {
		this.revenues_growth = revenues_growth;
	}
	public String getGrowth_growth() {
		return growth_growth;
	}
	public void setGrowth_growth(String growth_growth) {
		this.growth_growth = growth_growth;
	}
	public String getMergers_acquisitions() {
		return mergers_acquisitions;
	}
	public void setMergers_acquisitions(String mergers_acquisitions) {
		this.mergers_acquisitions = mergers_acquisitions;
	}
	public String getMerger_intention() {
		return merger_intention;
	}
	public void setMerger_intention(String merger_intention) {
		this.merger_intention = merger_intention;
	}
	public String getCurrent_ratio() {
		return current_ratio;
	}
	public void setCurrent_ratio(String current_ratio) {
		this.current_ratio = current_ratio;
	}
	public String getEquity_ratio() {
		return equity_ratio;
	}
	public void setEquity_ratio(String equity_ratio) {
		this.equity_ratio = equity_ratio;
	}
	public String getAssets_return() {
		return assets_return;
	}
	public void setAssets_return(String assets_return) {
		this.assets_return = assets_return;
	}
	public String getIncrease() {
		return increase;
	}
	public void setIncrease(String increase) {
		this.increase = increase;
	}
	public String getShareholder_ratio() {
		return shareholder_ratio;
	}
	public void setShareholder_ratio(String shareholder_ratio) {
		this.shareholder_ratio = shareholder_ratio;
	}
	public String getCreditor() {
		return creditor;
	}
	public void setCreditor(String creditor) {
		this.creditor = creditor;
	}
	public String getAnditor() {
		return anditor;
	}
	public void setAnditor(String anditor) {
		this.anditor = anditor;
	}
	public String getBoard_changes() {
		return board_changes;
	}
	public void setBoard_changes(String board_changes) {
		this.board_changes = board_changes;
	}
	public String getStaff_turnover() {
		return staff_turnover;
	}
	public void setStaff_turnover(String staff_turnover) {
		this.staff_turnover = staff_turnover;
	}
	public String getUnion_build() {
		return union_build;
	}
	public void setUnion_build(String union_build) {
		this.union_build = union_build;
	}
	public String getLabor_collective() {
		return labor_collective;
	}
	public void setLabor_collective(String labor_collective) {
		this.labor_collective = labor_collective;
	}
	public String getFlight_project_staff() {
		return flight_project_staff;
	}
	public void setFlight_project_staff(String flight_project_staff) {
		this.flight_project_staff = flight_project_staff;
	}
	public String getFlight_project_change() {
		return flight_project_change;
	}
	public void setFlight_project_change(String flight_project_change) {
		this.flight_project_change = flight_project_change;
	}
	public String getOrganization_strategy() {
		return organization_strategy;
	}
	public void setOrganization_strategy(String organization_strategy) {
		this.organization_strategy = organization_strategy;
	}
	public String getLegal_case() {
		return legal_case;
	}
	public void setLegal_case(String legal_case) {
		this.legal_case = legal_case;
	}
	public String getForce_majeure() {
		return force_majeure;
	}
	public void setForce_majeure(String force_majeure) {
		this.force_majeure = force_majeure;
	}
	String company_name;
	String address;
	String aerospace_address;
	String type;
	String vision;
	String mission;
	String objective;
	String business_description;
	String competitor;
	String advantage;
	String annual_report;
	String partners;
	String repair;
	String spare_support;
	String investment;
	String profit_ratio;
	String revenues_growth;
	String growth_growth;
	String mergers_acquisitions;
	String merger_intention;
	String current_ratio;
	String equity_ratio;
	String assets_return;
	String increase;
	String shareholder_ratio;
	String creditor;
	String anditor;
	String board_changes;
	String staff_turnover;
	String union_build;
	String labor_collective;
	String flight_project_staff;
	String flight_project_change;
	String organization_strategy;
	String legal_case;
	String force_majeure;
	String relation_id;
	public String getRelation_id() {
		return relation_id;
	}
	public void setRelation_id(String relation_id) {
		this.relation_id = relation_id;
	}

	
	
	
	public List<CompanyForm> getCompany_xinxi() {
		return company_xinxi;
	}
	public void setCompany_xinxi(List<CompanyForm> company_xinxi) {
		this.company_xinxi = company_xinxi;
	}
	List<CompanyForm> company_xinxi;
	
	
	
	
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	public String getOem() {
		return oem;
	}
	public void setOem(String oem) {
		this.oem = oem;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getSupplier_problemky() {
		return supplier_problemky;
	}
	public void setSupplier_problemky(String supplier_problemky) {
		this.supplier_problemky = supplier_problemky;
	}
	public String getSupplier_problemyi() {
		return supplier_problemyi;
	}
	public void setSupplier_problemyi(String supplier_problemyi) {
		this.supplier_problemyi = supplier_problemyi;
	}
	String news;
	String oem;
	String board;
	String staff;
	String supplier_problemky;
	String supplier_problemyi;

}
