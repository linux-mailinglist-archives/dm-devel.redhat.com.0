Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B7DE4225BAD
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 11:31:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-oUQpscM3Mj6FftOBRQ9vdw-1; Mon, 20 Jul 2020 05:31:33 -0400
X-MC-Unique: oUQpscM3Mj6FftOBRQ9vdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6B818C63C1;
	Mon, 20 Jul 2020 09:31:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D8A010021B3;
	Mon, 20 Jul 2020 09:31:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B17771809557;
	Mon, 20 Jul 2020 09:31:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06I0F085008427 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 20:15:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B08572018284; Sat, 18 Jul 2020 00:15:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 949462018283
	for <dm-devel@redhat.com>; Sat, 18 Jul 2020 00:14:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C173F85A5B2
	for <dm-devel@redhat.com>; Sat, 18 Jul 2020 00:14:57 +0000 (UTC)
Received: from sonic308-16.consmr.mail.ne1.yahoo.com
	(sonic308-16.consmr.mail.ne1.yahoo.com [66.163.187.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-199-w7LSoEvSNuWJr-iEX3jT0Q-1;
	Fri, 17 Jul 2020 20:14:55 -0400
X-MC-Unique: w7LSoEvSNuWJr-iEX3jT0Q-1
X-YMail-OSG: UqRaPv8VM1nwfOWASPi.Pn9SsCtIWp9ln56EbWO1Jqxqq_QtcLHB.CR8phmsZ8V
	UT3JhMfgpQVMBfxiTWj3ll4LyOCJ6Xm_9jW7.MXnBKl2ZTxbl4SJ_i4YDo1O.IG2w2jMDLVhdEKH
	D1IlocFt6NnoMchkgxGuvX0KmRb0cSh0612FFIt9j9Zov1Fdj0sXWXJZq_s4dCZPP4vAgxtrjCMb
	64JtwotV6ytbMQIx6MmY9l0M4uGCkkhbqIkdDLtViIPEi9m2OKZba3pyKOeLSKNNk4yDQ9ETjizy
	r2LxbMLePn_WOMttqQ6JsQAY6moz0.Z1n00llXMQJXTtd_OhDHEtXb7p3RjoBYYPMiK20JvoJ0PM
	8p8B1bWoCNFtvdwm7KQ5ntf0XmVX.cuIp4cjSAzoyj.4FFX2JXfXiWt2rQ4n.U80R5osR9AdjLAa
	vufXd_.WWtdY5iMkc8PwIygylKIJIpgmfOna5Op2nVb7VnkXxsxQPaRBR9jhgo6cNrb72hFxMJtS
	zO8fs.rI3Rhdv4_itgJW_KR1E2gtpHjfz6wwopZmNQDzlt7ow5FXQPzmPmNEua1IDCYFAMff43r4
	qMW3vGDs_IgtLwB6I9N8Si7Wys0KBEavHoICIMLmDA_fJ9vpnuijF3Bl.E7Pf9dbPB9.0e4j2NAA
	C2CAC2rqARcLcjWFMYVPGPJvEVbk0abT5qWdyA1T016Zv3WLy953dRiorBtE2jTvcW_o11Kncg.q
	Qrh7HQ9vATgtRvBm7clt.m2NzyCPqgfbPWAPpb9QcDuZx6zu7s313S08c3CUWadEArVutswa6OzT
	Kgao5opXvfbJdH7gasT_CSK.BOcm8R9XgpzWi6UWmsu5OLiD_2xEpxprQt02el3A1lWFI.B4uHj4
	eZUxq2yuMKE2faIAVk6vga1dVySYvNPt3fT2DFPHx7EzMQTp9GxljPUmEysxsK2M.y4S9392IpTX
	OyFLXfKdTgMu0mvFXK9wuTp_mJJaK3q5SU6uC0RCv7shKia3Vz45kX_5QReQep8xnue4CC6cErMH
	iJUJbUExFrf5jLgIxdR.Jg3Wc.sDH8eg3wW_4asXjj6CDVrkLaSGqKZ7AFr3ErexPCtGoVpNhir.
	zIfkjnrkw.4avorZRWwYjvssFuOU9WAn8yUC4EJ97ljV6tdcCU.10NPMCDntAPDQrAQdxsVfhpGi
	xAoGMTa1fFIrm0FZKJJZpRLxRdwmZe7ELSvns4au4w2IskmumS2_gfIr8t4_mH96cSCIMFDV0F9V
	3ArI0bUMH1pZZei9_mET3bvo3zoOchIpyxbanyKTCCdjX9XEo7xRl.vGtaxMYoXCGrrvpJcoF7r7
	0zAy5pt6tdZdBmAuwUfyS4XGvdTpKiaBUc2yTvT58cWmQCVkDSV69Uwq6JcNO6FBGNyqW8ltlcg1
	ChHzlvNtXC6NvKfokNtkKd0anCzgw5i2nUSdz4efft7Tf0nKpgD4-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic308.consmr.mail.ne1.yahoo.com with HTTP;
	Sat, 18 Jul 2020 00:14:54 +0000
Received: by smtp417.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID e5e855766364dd797c4e0e41ff08a860; 
	Sat, 18 Jul 2020 00:14:53 +0000 (UTC)
To: Deven Bowers <deven.desai@linux.microsoft.com>, agk@redhat.com,
	axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
	<20200717230941.1190744-6-deven.desai@linux.microsoft.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <1843d707-c62e-fa13-c663-c123ea1205a0@schaufler-ca.com>
Date: Fri, 17 Jul 2020 17:14:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717230941.1190744-6-deven.desai@linux.microsoft.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 05:30:57 -0400
Cc: sashal@kernel.org, mdsakib@microsoft.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, pasha.tatshin@soleen.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	Casey Schaufler <casey@schaufler-ca.com>,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v4 05/12] fs: add security blob and hooks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/17/2020 4:09 PM, Deven Bowers wrote:
> Add a security blob and associated allocation, deallocation and set hooks
> for a block_device structure.
>
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> ---
>  fs/block_dev.c                |  8 +++++
>  include/linux/fs.h            |  1 +
>  include/linux/lsm_hook_defs.h |  5 +++
>  include/linux/lsm_hooks.h     | 11 +++++++
>  include/linux/security.h      | 22 +++++++++++++
>  security/security.c           | 61 +++++++++++++++++++++++++++++++++++
>  6 files changed, 108 insertions(+)
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
> index 95b7c1d32062..8a728b7dd32d 100644
> --- a/include/linux/lsm_hooks.h
> +++ b/include/linux/lsm_hooks.h
> @@ -1507,6 +1507,16 @@
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
> + *	Set the security property associated with @name for @bdev with
> + *	value @value. @size indicates the size of the @value in bytes.
> + *
>   * Security hooks for perf events
>   *
>   * @perf_event_open:
> @@ -1553,6 +1563,7 @@ struct lsm_blob_sizes {
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
> index 70a7ad357bc6..8e61b7e6adfc 100644
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
> @@ -2516,6 +2541,42 @@ int security_locked_down(enum lockdown_reason what)
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
> +	return call_int_hook(bdev_setsecurity, 0, bdev, name, value, size);
> +}

What is your expectation regarding multiple security modules using the
same @name? What do you expect a security module to do if it does not
support a particular @name? You may have a case where SELinux supports
a @name that AppArmor (or KSRI) doesn't. -ENOSYS may be you friend here.

> +EXPORT_SYMBOL(security_bdev_setsecurity);
> +
>  #ifdef CONFIG_PERF_EVENTS
>  int security_perf_event_open(struct perf_event_attr *attr, int type)
>  {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

