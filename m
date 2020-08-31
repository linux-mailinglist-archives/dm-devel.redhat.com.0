Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A8F0125897B
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:44:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-XvuYRV31O8G-W6j3I-tNaA-1; Tue, 01 Sep 2020 03:44:09 -0400
X-MC-Unique: XvuYRV31O8G-W6j3I-tNaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F11725705B;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD5EE5C1BB;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 318FB79A33;
	Tue,  1 Sep 2020 07:44:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VBam8w012195 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 07:36:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 566D42028DC0; Mon, 31 Aug 2020 11:36:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 514C62028CCE
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:36:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AD4780029D
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:36:46 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-Hgn7ajAFMaiIfZjXkq6iZg-1; Mon, 31 Aug 2020 07:36:43 -0400
X-MC-Unique: Hgn7ajAFMaiIfZjXkq6iZg-1
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07VBWa9M088791; Mon, 31 Aug 2020 07:36:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 338yrv122f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 07:36:42 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07VBWtY6090160;
	Mon, 31 Aug 2020 07:36:41 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.102])
	by mx0a-001b2d01.pphosted.com with ESMTP id 338yrv121n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 07:36:41 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07VBX8mf030302; Mon, 31 Aug 2020 11:36:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 337e9gt4ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 11:36:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07VBabtx60948928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 31 Aug 2020 11:36:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F08F9A4054;
	Mon, 31 Aug 2020 11:36:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 790F7A4060;
	Mon, 31 Aug 2020 11:36:33 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.2.129])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2020 11:36:33 +0000 (GMT)
Message-ID: <e76bdb18c6045702156441470e50380445e6e218.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, agk@redhat.com, 
	snitzer@redhat.com, gmazyland@gmail.com
Date: Mon, 31 Aug 2020 07:36:32 -0400
In-Reply-To: <20200828015704.6629-3-tusharsu@linux.microsoft.com>
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-3-tusharsu@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-31_04:2020-08-31,
	2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	phishscore=0 malwarescore=0
	bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0
	clxscore=1015 impostorscore=0 suspectscore=0 mlxlogscore=999
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008310066
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 2/6] IMA: change
 process_buffer_measurement return type from void to int
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-27 at 18:57 -0700, Tushar Sugandhi wrote:
> process_buffer_measurement() does not return the result of the operation.
> Therefore, the consumers of this function cannot act on it, if needed.
> 
> Update return type of process_buffer_measurement() from void to int.

Failure to measure may be audited, but should never fail.  This is one
of the main differences between secure and trusted boot concepts. 
Notice in process_measurement() that -EACCES is only returned for
appraisal.

Returning a failure from process_buffer_measurement() in itself isn't a
problem, as long as the failure isn't returned to the LSM/IMA hook. 
However,  just as the callers of  process_measurement() originally
processed the result, that processing was moved into
process_measurement() [1].

Mimi

[1] 750943a30714 ima: remove enforce checking duplication

> 
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---
>  security/integrity/ima/ima.h      |  6 +++---
>  security/integrity/ima/ima_main.c | 14 +++++++-------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index 8875085db689..83ed57147e68 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -265,9 +265,9 @@ void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
>  			   struct evm_ima_xattr_data *xattr_value,
>  			   int xattr_len, const struct modsig *modsig, int pcr,
>  			   struct ima_template_desc *template_desc);
> -void process_buffer_measurement(struct inode *inode, const void *buf, int size,
> -				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *func_data);
> +int process_buffer_measurement(struct inode *inode, const void *buf, int size,
> +			       const char *eventname, enum ima_hooks func,
> +			       int pcr, const char *func_data);
>  void ima_audit_measurement(struct integrity_iint_cache *iint,
>  			   const unsigned char *filename);
>  int ima_alloc_init_template(struct ima_event_data *event_data,
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index c870fd6d2f83..0979a62a9257 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -736,9 +736,9 @@ int ima_load_data(enum kernel_load_data_id id)
>   *
>   * Based on policy, the buffer is measured into the ima log.
>   */
> -void process_buffer_measurement(struct inode *inode, const void *buf, int size,
> -				const char *eventname, enum ima_hooks func,
> -				int pcr, const char *func_data)
> +int process_buffer_measurement(struct inode *inode, const void *buf, int size,
> +			       const char *eventname, enum ima_hooks func,
> +			       int pcr, const char *func_data)
>  {
>  	int ret = 0;
>  	const char *audit_cause = "ENOMEM";
> @@ -758,7 +758,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  	u32 secid;
>  
>  	if (!ima_policy_flag)
> -		return;
> +		return 0;
>  
>  	/*
>  	 * Both LSM hooks and auxilary based buffer measurements are
> @@ -772,7 +772,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  		action = ima_get_action(inode, current_cred(), secid, 0, func,
>  					&pcr, &template, func_data);
>  		if (!(action & IMA_MEASURE))
> -			return;
> +			return 0;
>  	}
>  
>  	if (!pcr)
> @@ -787,7 +787,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  			pr_err("template %s init failed, result: %d\n",
>  			       (strlen(template->name) ?
>  				template->name : template->fmt), ret);
> -			return;
> +			return ret;
>  		}
>  	}
>  
> @@ -819,7 +819,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>  					func_measure_str(func),
>  					audit_cause, ret, 0, ret);
>  
> -	return;
> +	return ret;
>  }
>  
>  /**


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

