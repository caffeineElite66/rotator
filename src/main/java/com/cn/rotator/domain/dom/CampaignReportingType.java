package com.cn.rotator.domain.dom;

import javax.persistence.*;
import java.io.Serializable;

/**
 * User: kevin Date: 1/26/11 Time: 9:18 PM
 */
@Entity
@Table(name = "CampaignReportingType")
public class CampaignReportingType implements Serializable {

	private long id;
	private String reportingType;

	@Id
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "reporting_type")
	public String getReportingType() {
		return reportingType;
	}

	public void setReportingType(String reportingType) {
		this.reportingType = reportingType;
	}
}
