package com.cn.rotator.domain.dom;

import java.io.Serializable;
import javax.persistence.*;

/**
 * User: kevin Date: 1/26/11 Time: 9:40 PM
 */
@Entity
@Table(name = "CampaignType")
public class CampaignType implements Serializable {

	private long id;
	private String campaignType;

	public CampaignType() {
	}

	@Column(name = "campaign_type")
	public String getCampaignType() {

		return campaignType;
	}

	public void setCampaignType(String campaignType) {
		this.campaignType = campaignType;
	}

	@Id
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
