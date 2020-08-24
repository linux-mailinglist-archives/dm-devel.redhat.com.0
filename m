Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C5CDD2513D2
	for <lists+dm-devel@lfdr.de>; Tue, 25 Aug 2020 10:08:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-7lapKIGsOci4yH-WRd9LIQ-1; Tue, 25 Aug 2020 04:08:36 -0400
X-MC-Unique: 7lapKIGsOci4yH-WRd9LIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08FD80ED9A;
	Tue, 25 Aug 2020 08:08:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87D1260C0F;
	Tue, 25 Aug 2020 08:08:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6A6E181A06B;
	Tue, 25 Aug 2020 08:08:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07OMkxiM021093 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 18:46:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23BF8110F742; Mon, 24 Aug 2020 22:46:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F63E110F740
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 22:46:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33FAF8007A4
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 22:46:55 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-270-WlmpWYExOE-_TDlXMKZNRA-1; Mon, 24 Aug 2020 18:46:50 -0400
X-MC-Unique: WlmpWYExOE-_TDlXMKZNRA-1
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	07OMVqWL040172; Mon, 24 Aug 2020 18:46:49 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 334m6jvagp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 24 Aug 2020 18:46:49 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07OMVsRj040449;
	Mon, 24 Aug 2020 18:46:49 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.102])
	by mx0b-001b2d01.pphosted.com with ESMTP id 334m6jvag0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 24 Aug 2020 18:46:49 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	07OMcavW013663; Mon, 24 Aug 2020 22:46:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
	(d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 332uk6asy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 24 Aug 2020 22:46:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 07OMkjJ431261062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 24 Aug 2020 22:46:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F409FA405B;
	Mon, 24 Aug 2020 22:46:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F5EBA4054;
	Mon, 24 Aug 2020 22:46:42 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.38.197])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 24 Aug 2020 22:46:41 +0000 (GMT)
Message-ID: <d82c5cdab170d3dcc513b38632801c3aa14ca389.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, agk@redhat.com, 
	snitzer@redhat.com, gmazyland@gmail.com
Date: Mon, 24 Aug 2020 18:46:41 -0400
In-Reply-To: <20200821182107.5328-3-tusharsu@linux.microsoft.com>
References: <20200821182107.5328-1-tusharsu@linux.microsoft.com>
	<20200821182107.5328-3-tusharsu@linux.microsoft.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-08-24_12:2020-08-24,
	2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	adultscore=0 phishscore=0
	bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
	mlxscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2008240174
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 25 Aug 2020 03:46:37 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 2/3] IMA: add policy to support measuring
 critical data from kernel components
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-21 at 11:21 -0700, Tushar Sugandhi wrote:
> There would be several candidate kernel components suitable for IMA
> measurement. Not all of them would have support for IMA measurement.
> Also, system administrators may not want to measure data for all of
> them, even when they support IMA measurement. An IMA policy specific
> to various kernel components is needed to measure their respective
> critical data.
> 
> Add a new IMA policy CRITICAL_DATA+data_sources to support measuring
> various critical kernel components. This policy would enable the
> system administrators to limit the measurement to the components,
> if the components support IMA measurement.
> 
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---
>  Documentation/ABI/testing/ima_policy |  6 ++-
>  security/integrity/ima/ima.h         |  1 +
>  security/integrity/ima/ima_api.c     |  2 +-
>  security/integrity/ima/ima_policy.c  | 62 +++++++++++++++++++++++++---
>  4 files changed, 63 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
> index cd572912c593..a0dd0f108555 100644
> --- a/Documentation/ABI/testing/ima_policy
> +++ b/Documentation/ABI/testing/ima_policy
> @@ -29,7 +29,7 @@ Description:
>  		base: 	func:= [BPRM_CHECK][MMAP_CHECK][CREDS_CHECK][FILE_CHECK][MODULE_CHECK]
>  				[FIRMWARE_CHECK]
>  				[KEXEC_KERNEL_CHECK] [KEXEC_INITRAMFS_CHECK]
> -				[KEXEC_CMDLINE] [KEY_CHECK]
> +				[KEXEC_CMDLINE] [KEY_CHECK] [CRITICAL_DATA]
>  			mask:= [[^]MAY_READ] [[^]MAY_WRITE] [[^]MAY_APPEND]
>  			       [[^]MAY_EXEC]
>  			fsmagic:= hex value
> @@ -125,3 +125,7 @@ Description:
>  		keys added to .builtin_trusted_keys or .ima keyring:
>  
>  			measure func=KEY_CHECK keyrings=.builtin_trusted_keys|.ima
> +
> +		Example of measure rule using CRITICAL_DATA to measure critical data
> +
> +			measure func=CRITICAL_DATA data_sources=selinux|apparmor|dm-crypt

This example uses "data_sources" without first defining it in the
"option:" section.  Defining two new options is an indication that this
patch should be split up.  One which defines the "CRITICAL_DATA" and
another one which defines the new key value pair.  The term
"data_sources" is pretty generic.  Perhaps constrain it a bit by re-
naming it "critical_data=".  Or was such using a generic name
intentional?

Normally "CRITICAL_DATA" would be defined with the critical data hook,
but that seems to be defined in patch 3/3 "IMA: define IMA hook to
measure critical data from kernel components".

> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index 8875085db689..0f4209a92bfb 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -200,6 +200,7 @@ static inline unsigned int ima_hash_key(u8 *digest)
>  	hook(POLICY_CHECK, policy)			\
>  	hook(KEXEC_CMDLINE, kexec_cmdline)		\
>  	hook(KEY_CHECK, key)				\
> +	hook(CRITICAL_DATA, critical_data)		\
>  	hook(MAX_CHECK, none)
>  
>  #define __ima_hook_enumify(ENUM, str)	ENUM,
> diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
> index af218babd198..9917e1730cb6 100644
> --- a/security/integrity/ima/ima_api.c
> +++ b/security/integrity/ima/ima_api.c
> @@ -176,7 +176,7 @@ void ima_add_violation(struct file *file, const unsigned char *filename,
>   *		subj=, obj=, type=, func=, mask=, fsmagic=
>   *	subj,obj, and type: are LSM specific.
>   *	func: FILE_CHECK | BPRM_CHECK | CREDS_CHECK | MMAP_CHECK | MODULE_CHECK
> - *	| KEXEC_CMDLINE | KEY_CHECK
> + *	| KEXEC_CMDLINE | KEY_CHECK | CRITICAL_DATA
>   *	mask: contains the permission mask
>   *	fsmagic: hex value
>   *
> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index 8866e84d0062..7b649095ac7a 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -33,6 +33,7 @@
>  #define IMA_PCR		0x0100
>  #define IMA_FSNAME	0x0200
>  #define IMA_KEYRINGS	0x0400
> +#define IMA_DATA_SOURCES	0x0800
>  
>  #define UNKNOWN		0
>  #define MEASURE		0x0001	/* same as IMA_MEASURE */
> @@ -84,6 +85,7 @@ struct ima_rule_entry {
>  	} lsm[MAX_LSM_RULES];
>  	char *fsname;
>  	struct ima_rule_opt_list *keyrings; /* Measure keys added to these keyrings */
> +	struct ima_rule_opt_list *data_sources; /* Measure data from these sources */
>  	struct ima_template_desc *template;
>  };
>  
> @@ -508,14 +510,23 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
>  {
>  	int i;
>  
> -	if (func == KEY_CHECK) {
> -		return (rule->flags & IMA_FUNC) && (rule->func == func) &&
> -		       ima_match_rule_data(rule, rule->keyrings, func_data,
> -					   true, cred);
> -	}
>  	if ((rule->flags & IMA_FUNC) &&
>  	    (rule->func != func && func != POST_SETATTR))
>  		return false;
> +
> +	switch (func) {
> +	case KEY_CHECK:
> +		return ((rule->func == func) &&
> +			ima_match_rule_data(rule, rule->keyrings,
> +					    func_data, true, cred));
> +	case CRITICAL_DATA:
> +		return ((rule->func == func) &&
> +			ima_match_rule_data(rule, rule->data_sources,
> +					    func_data, false, cred));
> +	default:
> +		break;
> +	}
> +
>  	if ((rule->flags & IMA_MASK) &&
>  	    (rule->mask != mask && func != POST_SETATTR))
>  		return false;
> @@ -911,7 +922,7 @@ enum {
>  	Opt_uid_lt, Opt_euid_lt, Opt_fowner_lt,
>  	Opt_appraise_type, Opt_appraise_flag,
>  	Opt_permit_directio, Opt_pcr, Opt_template, Opt_keyrings,
> -	Opt_err
> +	Opt_data_sources, Opt_err
>  };
>  
>  static const match_table_t policy_tokens = {
> @@ -948,6 +959,7 @@ static const match_table_t policy_tokens = {
>  	{Opt_pcr, "pcr=%s"},
>  	{Opt_template, "template=%s"},
>  	{Opt_keyrings, "keyrings=%s"},
> +	{Opt_data_sources, "data_sources=%s"},
>  	{Opt_err, NULL}
>  };
>  
> @@ -1110,6 +1122,19 @@ static bool ima_validate_rule(struct ima_rule_entry *entry)
>  		if (ima_rule_contains_lsm_cond(entry))
>  			return false;
>  
> +		break;
> +	case CRITICAL_DATA:
> +		if (entry->action & ~(MEASURE | DONT_MEASURE))
> +			return false;
> +
> +		if (!(entry->flags & IMA_DATA_SOURCES) ||
> +		    (entry->flags & ~(IMA_FUNC | IMA_UID | IMA_PCR |
> +		    IMA_DATA_SOURCES)))
> +			return false;

Requiring IMA_FUNC and IMA_DATA_SOURCES makes sense, but why are
IMA_UID and IMA_PCR required?

> +
> +		if (ima_rule_contains_lsm_cond(entry))
> +			return false;
> +
>  		break;
>  	default:
>  		return false;
> @@ -1242,6 +1267,8 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
>  			else if (IS_ENABLED(CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS) &&
>  				 strcmp(args[0].from, "KEY_CHECK") == 0)
>  				entry->func = KEY_CHECK;
> +			else if (strcmp(args[0].from, "CRITICAL_DATA") == 0)
> +				entry->func = CRITICAL_DATA;
>  			else
>  				result = -EINVAL;
>  			if (!result)
> @@ -1312,6 +1339,23 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
>  
>  			entry->flags |= IMA_KEYRINGS;
>  			break;
> +		case Opt_data_sources:
> +			ima_log_string(ab, "data_sources", args[0].from);
> +
> +			if (entry->data_sources) {
> +				result = -EINVAL;
> +				break;
> +			}
> +
> +			entry->data_sources = ima_alloc_rule_opt_list(args);
> +			if (IS_ERR(entry->data_sources)) {
> +				result = PTR_ERR(entry->data_sources);
> +				entry->data_sources = NULL;
> +				break;
> +			}
> +

"keyrings=" isn't bounded because keyrings can be created by userspace.
Perhaps keyring names has a minimum/maximum length.  IMA isn't
measuring userspace construsts.  Shouldn't the list of critical data
being measured be bounded and verified?

Mimi

> +			entry->flags |= IMA_DATA_SOURCES;
> +			break;
>  		case Opt_fsuuid:
>  			ima_log_string(ab, "fsuuid", args[0].from);
>  
> @@ -1692,6 +1736,12 @@ int ima_policy_show(struct seq_file *m, void *v)
>  		seq_puts(m, " ");
>  	}
>  
> +	if (entry->flags & IMA_DATA_SOURCES) {
> +		seq_puts(m, "data_sources=");
> +		ima_show_rule_opt_list(m, entry->data_sources);
> +		seq_puts(m, " ");
> +	}
> +
>  	if (entry->flags & IMA_PCR) {
>  		snprintf(tbuf, sizeof(tbuf), "%d", entry->pcr);
>  		seq_printf(m, pt(Opt_pcr), tbuf);


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

