Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D1BB625897D
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:44:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-pRsSQvT2MXe-w90mbh9b5Q-1; Tue, 01 Sep 2020 03:44:09 -0400
X-MC-Unique: pRsSQvT2MXe-w90mbh9b5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDD805705A;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73A8376E01;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E48379A2C;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VH3BK1021588 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 13:03:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B58E30BB2; Mon, 31 Aug 2020 17:03:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36B9E33231
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 17:03:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2488787EF7E
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 17:03:09 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-100-YUTCXQFSM9aCowvNzRcqHw-1; Mon, 31 Aug 2020 13:03:06 -0400
X-MC-Unique: YUTCXQFSM9aCowvNzRcqHw-1
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07VH1v9c017870; Mon, 31 Aug 2020 13:03:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3393sutn1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 13:03:05 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07VH2SDO023355;
	Mon, 31 Aug 2020 13:03:05 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3393sutmyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 13:03:05 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07VGxDRK021536; Mon, 31 Aug 2020 17:03:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 337en8ac3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 17:03:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07VH30Uq12058924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 31 Aug 2020 17:03:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C950311C058;
	Mon, 31 Aug 2020 17:03:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD72511C05B;
	Mon, 31 Aug 2020 17:02:57 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.2.129]) by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2020 17:02:57 +0000 (GMT)
Message-ID: <f11dbfc1382e60c04fdd519ce5122239fa0cab8b.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, agk@redhat.com, 
	snitzer@redhat.com, gmazyland@gmail.com
Date: Mon, 31 Aug 2020 13:02:56 -0400
In-Reply-To: <20200828015704.6629-4-tusharsu@linux.microsoft.com>
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-4-tusharsu@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-31_08:2020-08-31,
	2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxlogscore=999 clxscore=1015
	priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
	impostorscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008310099
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 3/6] IMA: update
 process_buffer_measurement to measure buffer hash
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-27 at 18:57 -0700, Tushar Sugandhi wrote:
> process_buffer_measurement() currently only measures the input buffer.
> When the buffer being measured is too large, it may result in bloated
> IMA logs.

The subject of  this sentence refers to an individual record, while
"bloated" refers to the measurement list.  A "bloated" measurement list
would contain too many or unnecessary records.  Your concern seems to
be with the size of the individual record, not the number of
measurement list entries.

Measuring the hash of the buffer data is similar to measuring the file
data.  In the case of the file data, however, the attestation server
may rely on a white list manifest/DB or the file signature to verify
the file data hash.  For buffer measurements, how will the attestation
server ascertain what is a valid buffer hash?

Hint:  I assume, correct me if I'm wrong, the measurement list record
template data is not meant to be verified, but used to detect if the "critical data" changed.

Please update the patch description accordingly.

> 
> Introduce a boolean parameter measure_buf_hash to support measuring
> hash of a buffer, which would be much smaller, instead of the buffer
> itself.
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---

<snip>

> +++ b/security/integrity/ima/ima_main.c
> @@ -733,17 +733,21 @@ int ima_load_data(enum kernel_load_data_id id)
>   * @func: IMA hook
>   * @pcr: pcr to extend the measurement
>   * @func_data: private data specific to @func, can be NULL.
> + * @measure_buf_hash: if set to true - will measure hash of the buf,
> + *                    instead of buf
>   *
>   * Based on policy, the buffer is measured into the ima log.
>   */
>  int process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  			       const char *eventname, enum ima_hooks func,
> -			       int pcr, const char *func_data)
> +			       int pcr, const char *func_data,
> +			       bool measure_buf_hash)
>  {
>  	int ret = 0;
>  	const char *audit_cause = "ENOMEM";
>  	struct ima_template_entry *entry = NULL;
>  	struct integrity_iint_cache iint = {};
> +	struct integrity_iint_cache digest_iint = {};
>  	struct ima_event_data event_data = {.iint = &iint,
>  					    .filename = eventname,
>  					    .buf = buf,
> @@ -752,7 +756,7 @@ int process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  	struct {
>  		struct ima_digest_data hdr;
>  		char digest[IMA_MAX_DIGEST_SIZE];
> -	} hash = {};
> +	} hash = {}, digest_hash = {};
>  	int violation = 0;
>  	int action = 0;
>  	u32 secid;
> @@ -801,6 +805,24 @@ int process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  		goto out;
>  	}
>  
> +	if (measure_buf_hash) {
> +		digest_iint.ima_hash = &digest_hash.hdr;
> +		digest_iint.ima_hash->algo = ima_hash_algo;
> +		digest_iint.ima_hash->length = hash_digest_size[ima_hash_algo];
> +
> +		ret = ima_calc_buffer_hash(hash.hdr.digest,
> +					   iint.ima_hash->length,
> +					   digest_iint.ima_hash);
> +		if (ret < 0) {
> +			audit_cause = "digest_hashing_error";
> +			goto out;
> +		}
> +
> +		event_data.iint = &digest_iint;
> +		event_data.buf = hash.hdr.digest;
> +		event_data.buf_len = iint.ima_hash->length;
> +	}
> +

There seems to be some code and variable duplication by doing it this
way.  Copying the caluclated buffer data hash to a temporary buffer
might eliminate it.

>  	ret = ima_alloc_init_template(&event_data, &entry, template);
>  	if (ret < 0) {
>  		audit_cause = "alloc_entry";

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

