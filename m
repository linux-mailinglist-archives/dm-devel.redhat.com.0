Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AAFF423252A
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jul 2020 21:14:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-QbClFU7JPiChivc76Lb4_w-1; Wed, 29 Jul 2020 15:14:33 -0400
X-MC-Unique: QbClFU7JPiChivc76Lb4_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EAE3800460;
	Wed, 29 Jul 2020 19:14:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A448461176;
	Wed, 29 Jul 2020 19:14:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76C5095A71;
	Wed, 29 Jul 2020 19:14:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SMNBG9025696 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 18:23:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D83B980555; Tue, 28 Jul 2020 22:23:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D37588055C
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 22:23:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13931924902
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 22:23:09 +0000 (UTC)
Received: from sonic314-27.consmr.mail.ne1.yahoo.com
	(sonic314-27.consmr.mail.ne1.yahoo.com [66.163.189.153]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-41-kh8PZS5QNqKbweNmL7Zv-A-1;
	Tue, 28 Jul 2020 18:23:06 -0400
X-MC-Unique: kh8PZS5QNqKbweNmL7Zv-A-1
X-YMail-OSG: dQvHH.EVM1k0E4v6Nq3cEQOtaMxtmQPnsiLDciZxWpy1WE199wyER3bCnRqbk.E
	UfA8iK8xGbG5OMZ6tqjATuZ5sQOagmbrpgqYnRt51ObR51KBrv3Tc5QEgDaMHwk_tKtjbRDK5mND
	CueRo.HDv7.Kw5xiJX_Qc5UIQ.aN0jMes_r27yUb.6hz0hdUtC0vu0_2xnp0PJNWBA.yRgrHw65b
	ZK1sXw.i7b458ss5nURaBEW54mpSnUzBFunwJtmZhmkEvpxxIvObDFx5C0nU5rLWE.OOOLyH6LdZ
	PeRk.3_8YJ6b0EWfEhi.aeISZ38hNOwvmbPFpwmnL2W4yK30RszPCUjX7p8pXVxpxZXEn_d1oM_G
	EE6X_MF94kIIQrjvtZ0r4PNOjGVb.NE8YGp5D8UTaBmMAG.haHfjYgVEsRxUewPMDbmU5SL_IDsB
	4P9_5yM_DWv8Byr3xNNcxk8FjIG5WpvefLaasYuq1JUuKL0upnyMAgg868JeKvW_hf2EEvxUcCW5
	Bh8mZnmMRu8DcfZuccR3eLgs1so5HkYuGAlo7OWbnEjIkgTELOTfSpKpW3ZiWIiy2YtSHsL2LzsE
	vv3m.6fHDWukDkuLYZz9om6YaJQfK6OvDHbLn55OaQymMPa64w7AEn2RzPvzq3KxL8nTH_ZhBW9p
	oS4umU36i66.byYAH6kvF9LTbXQla9X8EE8SM3elqUO_Mnuzpd9Z856P2w1uvgyfjQtdZIU6LXBv
	0_StoPjGkIQUfRkfMPyXuNp7HdPMlGjbYqMWNjDsbvkzYsh.pRfVfNgpN88H.3FOAebzVPoNN2VA
	1Lim5qSfBShadfieFfdw4l1dXIRpxgJ98fP3kGFXkv2B.mzbxay_IPTK2Eo2VPltnssGHw6YbyIx
	SauDrwNS4F0Jiqmh9ZWM0SWfKbMLEZuqQO6NOpC3CTgkajAZdB0hcdz9aeI3ymHsCTa.3PMDOQ6P
	NimmGKcCjxTb8dTTB0NJu.NEBf9E_UZ1_MWzkY16H3SZPolyqiJkDcBBilXkVfIIq.MiQ4jVKZMC
	EsYuKjhPyA1ZuuGN4r1MwQCIE0zJPHTNjSPUT8Y5ZoqmPWy9TQ.tOJMvWeOUb9zQIV3LmFG2fH1V
	DzhHVGVhwp.Ot0wDPwMpI28licKHEHSDcB4fNZhavoeaIlOuxWHskBdkAqOOqp2HyktIurqGPyEg
	FsOkl7xMXQWeU4w2NDjhMaCiQuL.QAxqUr.qgQJlPPPKgZE3PBPNjnBtlAmFjGBcZtlCYJ5N6xzE
	lD1AzQ9juiB1s7iE7jab3pPFeM.ulTm8HuwTWtoyQF_qogm5mXCz3RoODKmXjaSfAgS5w0G7VC8G
	3qfIM1HrdYsXEvUIOtKwRS9hOCHI7tNjd8m36VZxxeEr_P.0NWyvv7PP9wupJPgJtPkpkO1Nsysq
	khPXdboUR2_0F2vlLONVNKjMtTynqA2qkDR99iCoEXI527jSexJv72TSh
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 28 Jul 2020 22:23:06 +0000
Received: by smtp425.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 97a8268f4a1460c1f731fb8cfd1e5697; 
	Tue, 28 Jul 2020 22:23:01 +0000 (UTC)
To: Deven Bowers <deven.desai@linux.microsoft.com>, agk@redhat.com,
	axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200728213614.586312-6-deven.desai@linux.microsoft.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <ef0fff6f-410a-6444-f1e3-03499a2f52b7@schaufler-ca.com>
Date: Tue, 28 Jul 2020 15:22:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728213614.586312-6-deven.desai@linux.microsoft.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 29 Jul 2020 15:11:19 -0400
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, mdsakib@microsoft.com,
	corbet@lwn.net, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	Casey Schaufler <casey@schaufler-ca.com>,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 05/11] fs: add security blob and hooks
 for block_device
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/28/2020 2:36 PM, Deven Bowers wrote:
> Add a security blob and associated allocation, deallocation and set hooks
> for a block_device structure.
>
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> ---
>  fs/block_dev.c                |  8 ++++
>  include/linux/fs.h            |  1 +
>  include/linux/lsm_hook_defs.h |  5 +++
>  include/linux/lsm_hooks.h     | 12 ++++++
>  include/linux/security.h      | 22 +++++++++++
>  security/security.c           | 74 +++++++++++++++++++++++++++++++++++
>  6 files changed, 122 insertions(+)
>
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 0ae656e022fd..8602dd62c3e2 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -34,6 +34,7 @@
>  #include <linux/falloc.h>
>  #include <linux/uaccess.h>
>  #include <linux/suspend.h>
> +#include <linux/security.h>
>  #include "internal.h"
>  
>  struct bdev_inode {
> @@ -768,11 +769,18 @@ static struct inode *bdev_alloc_inode(struct super_block *sb)
>  	struct bdev_inode *ei = kmem_cache_alloc(bdev_cachep, GFP_KERNEL);
>  	if (!ei)
>  		return NULL;
> +
> +	if (unlikely(security_bdev_alloc(&ei->bdev))) {
> +		kmem_cache_free(bdev_cachep, ei);
> +		return NULL;
> +	}
> +
>  	return &ei->vfs_inode;
>  }
>  
>  static void bdev_free_inode(struct inode *inode)
>  {
> +	security_bdev_free(&BDEV_I(inode)->bdev);
>  	kmem_cache_free(bdev_cachep, BDEV_I(inode));
>  }
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index f5abba86107d..42d7e3ce7712 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -509,6 +509,7 @@ struct block_device {
>  	int			bd_fsfreeze_count;
>  	/* Mutex for freeze */
>  	struct mutex		bd_fsfreeze_mutex;
> +	void			*security;
>  } __randomize_layout;
>  
>  /* XArray tags, for tagging dirty and writeback pages in the pagecache. */
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index af998f93d256..f3c0da0db4e8 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -391,3 +391,8 @@ LSM_HOOK(void, LSM_RET_VOID, perf_event_free, struct perf_event *event)
>  LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
>  LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
>  #endif /* CONFIG_PERF_EVENTS */
> +
> +LSM_HOOK(int, 0, bdev_alloc_security, struct block_device *bdev)
> +LSM_HOOK(void, LSM_RET_VOID, bdev_free_security, struct block_device *bdev)
> +LSM_HOOK(int, 0, bdev_setsecurity, struct block_device *bdev, const char *name,
> +	 const void *value, size_t size)
> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> index 95b7c1d32062..8670c19a8cef 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -1507,6 +1507,17 @@
>   *
>   *     @what: kernel feature being accessed
>   *
> + * @bdev_alloc_security:
> + *	Initialize the security field inside a block_device structure.
> + *
> + * @bdev_free_security:
> + *	Cleanup the security information stored inside a block_device structure.
> + *
> + * @bdev_setsecurity:
> + *	Set a security property associated with @name for @bdev with
> + *	value @value. @size indicates the size of @value in bytes.
> + *	If a @name is not implemented, return -ENOSYS.
> + *
>   * Security hooks for perf events
>   *
>   * @perf_event_open:
> @@ -1553,6 +1564,7 @@ struct lsm_blob_sizes {
>  	int	lbs_ipc;
>  	int	lbs_msg_msg;
>  	int	lbs_task;
> +	int	lbs_bdev;
>  };
>  
>  /*
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 0a0a03b36a3b..8f83fdc6c65d 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -451,6 +451,11 @@ int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
>  int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
>  int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
>  int security_locked_down(enum lockdown_reason what);
> +int security_bdev_alloc(struct block_device *bdev);
> +void security_bdev_free(struct block_device *bdev);
> +int security_bdev_setsecurity(struct block_device *bdev,
> +			      const char *name, const void *value,
> +			      size_t size);
>  #else /* CONFIG_SECURITY */
>  
>  static inline int call_blocking_lsm_notifier(enum lsm_event event, void *data)
> @@ -1291,6 +1296,23 @@ static inline int security_locked_down(enum lockdown_reason what)
>  {
>  	return 0;
>  }
> +
> +static inline int security_bdev_alloc(struct block_device *bdev)
> +{
> +	return 0;
> +}
> +
> +static inline void security_bdev_free(struct block_device *bdev)
> +{
> +}
> +
> +static inline int security_bdev_setsecurity(struct block_device *bdev,
> +					    const char *name,
> +					    const void *value, size_t size)
> +{
> +	return 0;
> +}
> +
>  #endif	/* CONFIG_SECURITY */
>  
>  #if defined(CONFIG_SECURITY) && defined(CONFIG_WATCH_QUEUE)
> diff --git a/security/security.c b/security/security.c
> index 70a7ad357bc6..fff445eba400 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -28,6 +28,7 @@
>  #include <linux/string.h>
>  #include <linux/msg.h>
>  #include <net/flow.h>
> +#include <linux/fs.h>
>  
>  #define MAX_LSM_EVM_XATTR	2
>  
> @@ -202,6 +203,7 @@ static void __init lsm_set_blob_sizes(struct lsm_blob_sizes *needed)
>  	lsm_set_blob_size(&needed->lbs_ipc, &blob_sizes.lbs_ipc);
>  	lsm_set_blob_size(&needed->lbs_msg_msg, &blob_sizes.lbs_msg_msg);
>  	lsm_set_blob_size(&needed->lbs_task, &blob_sizes.lbs_task);
> +	lsm_set_blob_size(&needed->lbs_bdev, &blob_sizes.lbs_bdev);
>  }
>  
>  /* Prepare LSM for initialization. */
> @@ -337,6 +339,7 @@ static void __init ordered_lsm_init(void)
>  	init_debug("ipc blob size      = %d\n", blob_sizes.lbs_ipc);
>  	init_debug("msg_msg blob size  = %d\n", blob_sizes.lbs_msg_msg);
>  	init_debug("task blob size     = %d\n", blob_sizes.lbs_task);
> +	init_debug("bdev blob size     = %d\n", blob_sizes.lbs_bdev);
>  
>  	/*
>  	 * Create any kmem_caches needed for blobs
> @@ -654,6 +657,28 @@ static int lsm_msg_msg_alloc(struct msg_msg *mp)
>  	return 0;
>  }
>  
> +/**
> + * lsm_bdev_alloc - allocate a composite block_device blob
> + * @bdev: the block_device that needs a blob
> + *
> + * Allocate the block_device blob for all the modules
> + *
> + * Returns 0, or -ENOMEM if memory can't be allocated.
> + */
> +static int lsm_bdev_alloc(struct block_device *bdev)
> +{
> +	if (blob_sizes.lbs_bdev == 0) {
> +		bdev->security = NULL;
> +		return 0;
> +	}
> +
> +	bdev->security = kzalloc(blob_sizes.lbs_bdev, GFP_KERNEL);
> +	if (!bdev->security)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  /**
>   * lsm_early_task - during initialization allocate a composite task blob
>   * @task: the task that needs a blob
> @@ -2516,6 +2541,55 @@ int security_locked_down(enum lockdown_reason what)
>  }
>  EXPORT_SYMBOL(security_locked_down);
>  
> +int security_bdev_alloc(struct block_device *bdev)
> +{
> +	int rc = 0;
> +
> +	rc = lsm_bdev_alloc(bdev);
> +	if (unlikely(rc))
> +		return rc;
> +
> +	rc = call_int_hook(bdev_alloc_security, 0, bdev);
> +	if (unlikely(rc))
> +		security_bdev_free(bdev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(security_bdev_alloc);
> +
> +void security_bdev_free(struct block_device *bdev)
> +{
> +	if (!bdev->security)
> +		return;
> +
> +	call_void_hook(bdev_free_security, bdev);
> +
> +	kfree(bdev->security);
> +	bdev->security = NULL;
> +}
> +EXPORT_SYMBOL(security_bdev_free);
> +
> +int security_bdev_setsecurity(struct block_device *bdev,
> +			      const char *name, const void *value,
> +			      size_t size)
> +{
> +	int rc = 0;
> +	struct security_hook_list *p;
> +
> +	hlist_for_each_entry(p, &security_hook_heads.bdev_setsecurity, list) {
> +		rc = p->hook.bdev_setsecurity(bdev, name, value, size);
> +
> +		if (rc == -ENOSYS)
> +			rc = 0;
> +
> +		if (rc != 0)

Perhaps:
		else if (rc != 0)

> +			break;
> +	}
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(security_bdev_setsecurity);
> +
>  #ifdef CONFIG_PERF_EVENTS
>  int security_perf_event_open(struct perf_event_attr *attr, int type)
>  {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

