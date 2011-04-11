package com.cn.rotator.domain.dom;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

/**
 * User: kevin Date: 1/26/11 Time: 9:42 PM
 */
@Entity
@Table(name = "ConvertedTraffic")
public class ConvertedTraffic implements Serializable {

	private long id;
	private long rawTrafficId;
	private Date createdAt;
	private String tag;
	private long requestDataId;

	public ConvertedTraffic() {
	}

	@Id
	public long getId() {

		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "raw_traffic_id")
	public long getRawTrafficId() {
		return rawTrafficId;
	}

	public void setRawTrafficId(long rawTrafficId) {
		this.rawTrafficId = rawTrafficId;
	}

	@Column(name = "created_at")
	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Column(name = "tag")
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Column(name = "request_data_id")
	public long getRequestDataId() {
		return requestDataId;
	}

	public void setRequestDataId(long requestDataId) {
		this.requestDataId = requestDataId;
	}
}
