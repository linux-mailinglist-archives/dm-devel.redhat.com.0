Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15B94258978
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 09:44:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-P4475OsIOCaH_-yy9Uey-A-1; Tue, 01 Sep 2020 03:44:07 -0400
X-MC-Unique: P4475OsIOCaH_-yy9Uey-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E2DC1007466;
	Tue,  1 Sep 2020 07:44:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 925C25C1A3;
	Tue,  1 Sep 2020 07:44:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F319779A33;
	Tue,  1 Sep 2020 07:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VBuJ8T014929 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 07:56:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F28F42166B44; Mon, 31 Aug 2020 11:56:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED2812166B28
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:56:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D7EB101A568
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:56:16 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-379-4QMQjuenNxejFJL-QnONLg-1; Mon, 31 Aug 2020 07:55:55 -0400
X-MC-Unique: 4QMQjuenNxejFJL-QnONLg-1
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07VB2sWA140194; Mon, 31 Aug 2020 07:55:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 338xgvbgf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 07:55:54 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07VBPJig031055;
	Mon, 31 Aug 2020 07:55:54 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
	[149.81.74.108])
	by mx0b-001b2d01.pphosted.com with ESMTP id 338xgvbget-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 07:55:53 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07VBmS5r002148; Mon, 31 Aug 2020 11:55:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma05fra.de.ibm.com with ESMTP id 337en819qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 31 Aug 2020 11:55:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07VBtnPh26411484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 31 Aug 2020 11:55:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47839A405B;
	Mon, 31 Aug 2020 11:55:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C219A4051;
	Mon, 31 Aug 2020 11:55:46 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.2.129]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2020 11:55:45 +0000 (GMT)
Message-ID: <4802c73c2ed22c64ea4f315d3115ead919c3205e.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, agk@redhat.com, 
	snitzer@redhat.com, gmazyland@gmail.com
Date: Mon, 31 Aug 2020 07:55:45 -0400
In-Reply-To: <20200828015704.6629-2-tusharsu@linux.microsoft.com>
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-2-tusharsu@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-31_04:2020-08-31,
	2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0
	impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
	mlxscore=0
	spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008310062
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Sep 2020 03:43:47 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 1/6] IMA: generalize keyring specific
 measurement constructs
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

On Thu, 2020-08-27 at 18:56 -0700, Tushar Sugandhi wrote:
> IMA functions such as ima_match_keyring(), process_buffer_measurement(),
> ima_match_policy() etc. handle data specific to keyrings. Currently,
> these constructs are not generic to handle any func specific data.
> This makes it harder to extend without code duplication.
> 
> Refactor the keyring specific measurement constructs to be generic and
> reusable in other measurement scenarios.

Mostly this patch changes the variable name from keyring to func_data,
which is good.  Other changes should be minimized.

> 
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---

<snip>

> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index fe1df373c113..8866e84d0062 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -451,15 +451,21 @@ int ima_lsm_policy_change(struct notifier_block *nb, unsigned long event,
>  }
>  
>  /**
> - * ima_match_keyring - determine whether the keyring matches the measure rule
> - * @rule: a pointer to a rule
> - * @keyring: name of the keyring to match against the measure rule
> + * ima_match_rule_data - determine whether the given func_data matches
> + *			 the measure rule data
> + * @rule: IMA policy rule
> + * @opt_list: rule data to match func_data against
> + * @func_data: data to match against the measure rule data
> + * @allow_empty_opt_list: If true matches all func_data
>   * @cred: a pointer to a credentials structure for user validation
>   *
> - * Returns true if keyring matches one in the rule, false otherwise.
> + * Returns true if func_data matches one in the rule, false otherwise.
>   */
> -static bool ima_match_keyring(struct ima_rule_entry *rule,
> -			      const char *keyring, const struct cred *cred)
> +static bool ima_match_rule_data(struct ima_rule_entry *rule,
> +				const struct ima_rule_opt_list *opt_list, 

Ok

> +				const char *func_data,
> +				bool allow_empty_opt_list,

As the policy is loaded, shouldn't the rules should be checked, not
here on usage?

Mimi

> +				const struct cred *cred)
>  {
>  	bool matched = false;
>  	size_t i;
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

