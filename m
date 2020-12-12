Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACA862D96C8
	for <lists+dm-devel@lfdr.de>; Mon, 14 Dec 2020 12:01:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-01jssQCpN5KGe11TVhG5Jw-1; Mon, 14 Dec 2020 06:01:06 -0500
X-MC-Unique: 01jssQCpN5KGe11TVhG5Jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 987FD6D532;
	Mon, 14 Dec 2020 11:00:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 678EF2B6C4;
	Mon, 14 Dec 2020 11:00:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B42C18095FF;
	Mon, 14 Dec 2020 11:00:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BCJKVw4004789 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Dec 2020 14:20:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A6D5A2026D48; Sat, 12 Dec 2020 19:20:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1BB22026D47
	for <dm-devel@redhat.com>; Sat, 12 Dec 2020 19:20:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48EF48007D9
	for <dm-devel@redhat.com>; Sat, 12 Dec 2020 19:20:29 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-207-vFUVJa7nNlStOjgXAyK_0w-1;
	Sat, 12 Dec 2020 14:20:26 -0500
X-MC-Unique: vFUVJa7nNlStOjgXAyK_0w-1
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net
	[162.237.133.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id E476820B717A;
	Sat, 12 Dec 2020 11:20:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E476820B717A
Date: Sat, 12 Dec 2020 13:20:22 -0600
From: Tyler Hicks <tyhicks@linux.microsoft.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <20201212192022.GI4951@sequoia>
References: <20201212180251.9943-1-tusharsu@linux.microsoft.com>
	<20201212180251.9943-5-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20201212180251.9943-5-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:00:28 -0500
Cc: sashal@kernel.org, paul@paul-moore.com, snitzer@redhat.com,
	selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
	jmorris@namei.org, zohar@linux.ibm.com,
	linux-kernel@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module@vger.kernel.org, casey@schaufler-ca.com,
	linux-integrity@vger.kernel.org, dm-devel@redhat.com,
	gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v9 4/8] IMA: add policy rule to measure
	critical data
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-12-12 10:02:47, Tushar Sugandhi wrote:
> A new IMA policy rule is needed for the IMA hook
> ima_measure_critical_data() and the corresponding func CRITICAL_DATA for
> measuring the input buffer. The policy rule should ensure the buffer
> would get measured only when the policy rule allows the action. The
> policy rule should also support the necessary constraints (flags etc.)
> for integrity critical buffer data measurements.
> 
> Add a policy rule to define the constraints for restricting integrity
> critical data measurements.
> 
> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>

This looks nice. Thanks for the changes!

Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>

Tyler

> ---
>  Documentation/ABI/testing/ima_policy |  2 +-
>  security/integrity/ima/ima_policy.c  | 29 ++++++++++++++++++++++++----
>  2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
> index e35263f97fc1..6ec7daa87cba 100644
> --- a/Documentation/ABI/testing/ima_policy
> +++ b/Documentation/ABI/testing/ima_policy
> @@ -32,7 +32,7 @@ Description:
>  			func:= [BPRM_CHECK][MMAP_CHECK][CREDS_CHECK][FILE_CHECK]MODULE_CHECK]
>  			        [FIRMWARE_CHECK]
>  				[KEXEC_KERNEL_CHECK] [KEXEC_INITRAMFS_CHECK]
> -				[KEXEC_CMDLINE] [KEY_CHECK]
> +				[KEXEC_CMDLINE] [KEY_CHECK] [CRITICAL_DATA]
>  			mask:= [[^]MAY_READ] [[^]MAY_WRITE] [[^]MAY_APPEND]
>  			       [[^]MAY_EXEC]
>  			fsmagic:= hex value
> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> index a09d1a41a290..d45c2dbb6d45 100644
> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -479,6 +479,8 @@ static bool ima_match_rule_data(struct ima_rule_entry *rule,
>  
>  		opt_list = rule->keyrings;
>  		break;
> +	case CRITICAL_DATA:
> +		return true;
>  	default:
>  		return false;
>  	}
> @@ -515,13 +517,19 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
>  {
>  	int i;
>  
> -	if (func == KEY_CHECK) {
> -		return (rule->flags & IMA_FUNC) && (rule->func == func) &&
> -			ima_match_rule_data(rule, func_data, cred);
> -	}
>  	if ((rule->flags & IMA_FUNC) &&
>  	    (rule->func != func && func != POST_SETATTR))
>  		return false;
> +
> +	switch (func) {
> +	case KEY_CHECK:
> +	case CRITICAL_DATA:
> +		return ((rule->func == func) &&
> +			ima_match_rule_data(rule, func_data, cred));
> +	default:
> +		break;
> +	}
> +
>  	if ((rule->flags & IMA_MASK) &&
>  	    (rule->mask != mask && func != POST_SETATTR))
>  		return false;
> @@ -1116,6 +1124,17 @@ static bool ima_validate_rule(struct ima_rule_entry *entry)
>  		if (ima_rule_contains_lsm_cond(entry))
>  			return false;
>  
> +		break;
> +	case CRITICAL_DATA:
> +		if (entry->action & ~(MEASURE | DONT_MEASURE))
> +			return false;
> +
> +		if (entry->flags & ~(IMA_FUNC | IMA_UID | IMA_PCR))
> +			return false;
> +
> +		if (ima_rule_contains_lsm_cond(entry))
> +			return false;
> +
>  		break;
>  	default:
>  		return false;
> @@ -1248,6 +1267,8 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
>  			else if (IS_ENABLED(CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS) &&
>  				 strcmp(args[0].from, "KEY_CHECK") == 0)
>  				entry->func = KEY_CHECK;
> +			else if (strcmp(args[0].from, "CRITICAL_DATA") == 0)
> +				entry->func = CRITICAL_DATA;
>  			else
>  				result = -EINVAL;
>  			if (!result)
> -- 
> 2.17.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

