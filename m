Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B8347223754
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jul 2020 10:47:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-vIS_uhk2MO6U4yIHriOkQA-1; Fri, 17 Jul 2020 04:47:48 -0400
X-MC-Unique: vIS_uhk2MO6U4yIHriOkQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC8DD10059AA;
	Fri, 17 Jul 2020 08:47:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8425F9DB;
	Fri, 17 Jul 2020 08:47:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C14C1809554;
	Fri, 17 Jul 2020 08:47:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06FJQf2h016045 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 15:26:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86B152157F24; Wed, 15 Jul 2020 19:26:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3F72166BA4
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 19:26:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04AEE8007CB
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 19:26:38 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-351-8AvWYISFN1ec7GQClb6vjw-1;
	Wed, 15 Jul 2020 15:26:33 -0400
X-MC-Unique: 8AvWYISFN1ec7GQClb6vjw-1
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net
	[162.237.133.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id 57B7F20B4908;
	Wed, 15 Jul 2020 12:16:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 57B7F20B4908
Date: Wed, 15 Jul 2020 14:16:17 -0500
From: Tyler Hicks <tyhicks@linux.microsoft.com>
To: deven.desai@linux.microsoft.com
Message-ID: <20200715191617.GD3673@sequoia>
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<20200415162550.2324-4-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20200415162550.2324-4-deven.desai@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 17 Jul 2020 04:47:16 -0400
Cc: axboe@kernel.dk, sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	jannh@google.com, linux-kernel@vger.kernel.org, corbet@lwn.net,
	pasha.tatashin@soleen.com, jmorris@namei.org,
	zohar@linux.ibm.com, mdsakib@linux.microsoft.com,
	linux-block@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH v3 03/12] security: add ipe lsm policy
 parser and policy loading
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-04-15 09:25:41, deven.desai@linux.microsoft.com wrote:
> From: Deven Bowers <deven.desai@linux.microsoft.com>
> 
> Adds the policy parser and the policy loading to IPE, along with the
> related sysfs, securityfs entries, and audit events.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> ---

...

> diff --git a/security/ipe/ipe-sysfs.c b/security/ipe/ipe-sysfs.c
> index 1c65185c531d..a250da29c3b5 100644
> --- a/security/ipe/ipe-sysfs.c
> +++ b/security/ipe/ipe-sysfs.c
> @@ -5,6 +5,7 @@
>  
>  #include "ipe.h"
>  #include "ipe-audit.h"
> +#include "ipe-secfs.h"
>  
>  #include <linux/sysctl.h>
>  #include <linux/fs.h>
> @@ -45,6 +46,79 @@ static int ipe_switch_mode(struct ctl_table *table, int write,
>  
>  #endif /* CONFIG_SECURITY_IPE_PERMISSIVE_SWITCH */
>  
> +#ifdef CONFIG_SECURITYFS
> +
> +/**
> + * ipe_switch_active_policy: Handler to switch the policy IPE is enforcing.
> + * @table: Sysctl table entry from the variable, sysctl_table.
> + * @write: Integer indicating whether this is a write or a read.
> + * @buffer: Data passed to sysctl. This is the policy id to activate,
> + *	    for this function.
> + * @lenp: Pointer to the size of @buffer.
> + * @ppos: Offset into @buffer.
> + *
> + * This wraps proc_dointvec_minmax, and if there's a change, emits an
> + * audit event.
> + *
> + * Return:
> + * 0 - OK
> + * -ENOMEM - Out of memory
> + * -ENOENT - Policy identified by @id does not exist
> + * Other - See proc_dostring and retrieve_backed_dentry
> + */
> +static int ipe_switch_active_policy(struct ctl_table *table, int write,
> +				    void __user *buffer, size_t *lenp,
> +				    loff_t *ppos)
> +{
> +	int rc = 0;
> +	char *id = NULL;
> +	size_t size = 0;
> +
> +	if (write) {

I see that the policy files in securityfs, such as new_policy, are
checking for CAP_MAC_ADMIN but there's no check here for CAP_MAC_ADMIN
when switching the active policy. I think we should enforce that cap
here, too.

Thinking about it some more, I find it a little odd that we're spreading
the files necessary to update a policy across both procfs (sysctl) and
securityfs. It looks like procfs will have different semantics than
securityfs after looking at proc_sys_permission(). I suggest moving
strict_parse and active_policy under securityfs for a unified experience
and common location when updating policy.

Tyler

> +		id = kzalloc((*lenp) + 1, GFP_KERNEL);
> +		if (!id)
> +			return -ENOMEM;
> +
> +		table->data = id;
> +		table->maxlen = (*lenp) + 1;
> +
> +		rc = proc_dostring(table, write, buffer, lenp, ppos);
> +		if (rc != 0)
> +			goto out;
> +
> +		rc = ipe_set_active_policy(id, strlen(id));
> +	} else {
> +		if (!rcu_access_pointer(ipe_active_policy)) {
> +			table->data = "";
> +			table->maxlen = 1;
> +			return proc_dostring(table, write, buffer, lenp, ppos);
> +		}
> +
> +		rcu_read_lock();
> +		size = strlen(rcu_dereference(ipe_active_policy)->policy_name);
> +		rcu_read_unlock();
> +
> +		id = kzalloc(size + 1, GFP_KERNEL);
> +		if (!id)
> +			return -ENOMEM;
> +
> +		rcu_read_lock();
> +		strncpy(id, rcu_dereference(ipe_active_policy)->policy_name,
> +			size);
> +		rcu_read_unlock();
> +
> +		table->data = id;
> +		table->maxlen = size;
> +
> +		rc = proc_dostring(table, write, buffer, lenp, ppos);
> +	}
> +out:
> +	kfree(id);
> +	return rc;
> +}
> +
> +#endif /* CONFIG_SECURITYFS */
> +
>  static struct ctl_table_header *sysctl_header;
>  
>  static const struct ctl_path sysctl_path[] = {
> @@ -75,6 +149,24 @@ static struct ctl_table sysctl_table[] = {
>  		.extra1 = SYSCTL_ZERO,
>  		.extra2 = SYSCTL_ONE,
>  	},
> +#ifdef CONFIG_SECURITYFS
> +	{
> +		.procname = "strict_parse",
> +		.data = &ipe_strict_parse,
> +		.maxlen = sizeof(int),
> +		.mode = 0644,
> +		.proc_handler = proc_dointvec_minmax,
> +		.extra1 = SYSCTL_ZERO,
> +		.extra2 = SYSCTL_ONE,
> +	},
> +	{
> +		.procname = "active_policy",
> +		.data = NULL,
> +		.maxlen = 0,
> +		.mode = 0644,
> +		.proc_handler = ipe_switch_active_policy,
> +	},
> +#endif /* CONFIG_SECURITYFS */
>  	{}
>  };
>  
> diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
> index b6553e370f98..07f855ffb79a 100644
> --- a/security/ipe/ipe.c
> +++ b/security/ipe/ipe.c
> @@ -6,6 +6,7 @@
>  #include "ipe.h"
>  #include "ipe-policy.h"
>  #include "ipe-hooks.h"
> +#include "ipe-secfs.h"
>  #include "ipe-sysfs.h"
>  
>  #include <linux/module.h>
> @@ -60,3 +61,4 @@ DEFINE_LSM(ipe) = {
>  
>  int ipe_enforce = 1;
>  int ipe_success_audit;
> +int ipe_strict_parse;
> diff --git a/security/ipe/ipe.h b/security/ipe/ipe.h
> index 6a47f55b05d9..bf6cf7744b0e 100644
> --- a/security/ipe/ipe.h
> +++ b/security/ipe/ipe.h
> @@ -16,5 +16,6 @@
>  
>  extern int ipe_enforce;
>  extern int ipe_success_audit;
> +extern int ipe_strict_parse;
>  
>  #endif /* IPE_H */
> -- 
> 2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

