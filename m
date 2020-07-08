Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 663AD218FBD
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 20:32:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-lv52oE28OAWi6qkXxLBmXg-1; Wed, 08 Jul 2020 14:32:56 -0400
X-MC-Unique: lv52oE28OAWi6qkXxLBmXg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60D5C107B477;
	Wed,  8 Jul 2020 18:32:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A8A55D9F3;
	Wed,  8 Jul 2020 18:32:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8035493F7A;
	Wed,  8 Jul 2020 18:32:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068IQvN7022529 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 14:26:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5844176DC; Wed,  8 Jul 2020 18:26:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D19AD9D4C
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 18:26:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 780381049BDD
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 18:26:55 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-194-8ytkYV1aN6qsdmeiuXEjHQ-1; Wed, 08 Jul 2020 14:26:50 -0400
X-MC-Unique: 8ytkYV1aN6qsdmeiuXEjHQ-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 59E162A5EB1
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Organization: Collabora
References: <alpine.LRH.2.02.2007081222500.4103@file01.intranet.prod.int.rdu2.redhat.com>
Date: Wed, 08 Jul 2020 14:26:45 -0400
In-Reply-To: <alpine.LRH.2.02.2007081222500.4103@file01.intranet.prod.int.rdu2.redhat.com>
	(Mikulas Patocka's message of "Wed, 8 Jul 2020 12:25:20 -0400 (EDT)")
Message-ID: <873661g8wq.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Tahsin Erdogan <tahsin@google.com>, Mike Snitzer <msnitzer@redhat.com>,
	dm-devel@redhat.com, Khazhismel Kumykov <khazhy@google.com>
Subject: Re: [dm-devel] [PATCH] dm: use noio when sending kobject event
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mikulas Patocka <mpatocka@redhat.com> writes:

> kobject_uevent may allocate memory and it may be called while there are dm
> devices suspended. The allocation may recurse into a suspended device,
> causing a deadlock. We must set the noio flag when sending a uevent.

If I understand it correctly, considering the deadlock you shared, this
doesn't solve the entire issue. For instance, kobject_uevent_env on the
GFP_NOIO thread waits on uevent_sock_mutex, and another thread with
GFP_IO holding the mutex might have triggered the shrinker from inside
kobject_uevent_net_broadcast.  I believe 7e7cd796f277 ("scsi: iscsi: Fix
deadlock on recovery path during GFP_IO reclaim") solved the one you
shared and other similar cases for iSCSI in a different way.

I know this is similar to the log I shared on an earlier patch. Are you
able to reproduce the deadlock with the above patch applied?

That said, I think this patch is an improvement as we shouldn't be using
GFP_IO in this path to begin with, so please add:

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>


> This is the observed deadlock:
>
> iSCSI-write
>      holding: rx_queue_mutex
>      waiting: uevent_sock_mutex
>
>      kobject_uevent_env+0x1bd/0x419
>      kobject_uevent+0xb/0xd
>      device_add+0x48a/0x678
>      scsi_add_host_with_dma+0xc5/0x22d
>      iscsi_host_add+0x53/0x55
>      iscsi_sw_tcp_session_create+0xa6/0x129
>      iscsi_if_rx+0x100/0x1247
>      netlink_unicast+0x213/0x4f0
>      netlink_sendmsg+0x230/0x3c0
>
> iscsi_fail iscsi_conn_failure
>      waiting: rx_queue_mutex
>
>      schedule_preempt_disabled+0x325/0x734
>      __mutex_lock_slowpath+0x18b/0x230
>      mutex_lock+0x22/0x40
>      iscsi_conn_failure+0x42/0x149
>      worker_thread+0x24a/0xbc0
>
> EventManager_
>      holding: uevent_sock_mutex
>      waiting: dm_bufio_client->lock
>
>      dm_bufio_lock+0xe/0x10
>      shrink+0x34/0xf7
>      shrink_slab+0x177/0x5d0
>      do_try_to_free_pages+0x129/0x470
>      try_to_free_mem_cgroup_pages+0x14f/0x210
>      memcg_kmem_newpage_charge+0xa6d/0x13b0
>      __alloc_pages_nodemask+0x4a3/0x1a70
>      fallback_alloc+0x1b2/0x36c
>      __kmalloc_node_track_caller+0xb9/0x10d0
>      __alloc_skb+0x83/0x2f0
>      kobject_uevent_env+0x26b/0x419
>      dm_kobject_uevent+0x70/0x79
>      dev_suspend+0x1a9/0x1e7
>      ctl_ioctl+0x3e9/0x411
>      dm_ctl_ioctl+0x13/0x17
>      do_vfs_ioctl+0xb3/0x460
>      SyS_ioctl+0x5e/0x90
>
> MemcgReclaimerD
>      holding: dm_bufio_client->lock
>      waiting: stuck io to finish (needs iscsi_fail thread to progress)
>
>      schedule at ffffffffbd603618
>      io_schedule at ffffffffbd603ba4
>      do_io_schedule at ffffffffbdaf0d94
>      __wait_on_bit at ffffffffbd6008a6
>      out_of_line_wait_on_bit at ffffffffbd600960
>      wait_on_bit.constprop.10 at ffffffffbdaf0f17
>      __make_buffer_clean at ffffffffbdaf18ba
>      __cleanup_old_buffer at ffffffffbdaf192f
>      shrink at ffffffffbdaf19fd
>      do_shrink_slab at ffffffffbd6ec000
>      shrink_slab at ffffffffbd6ec24a
>      do_try_to_free_pages at ffffffffbd6eda09
>      try_to_free_mem_cgroup_pages at ffffffffbd6ede7e
>      mem_cgroup_resize_limit at ffffffffbd7024c0
>      mem_cgroup_write at ffffffffbd703149
>      cgroup_file_write at ffffffffbd6d9c6e
>      sys_write at ffffffffbd6662ea
>      system_call_fastpath at ffffffffbdbc34a2
>
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Reported-by: Khazhismel Kumykov <khazhy@google.com>
> Reported-by: Tahsin Erdogan <tahsin@google.com>
> Reported-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Cc: stable@vger.kernel.org
>
> ---
>  drivers/md/dm.c |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> Index: linux-2.6/drivers/md/dm.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm.c	2020-06-29 14:50:22.000000000 +0200
> +++ linux-2.6/drivers/md/dm.c	2020-07-08 18:17:55.000000000 +0200
> @@ -12,6 +12,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/sched/mm.h>
>  #include <linux/sched/signal.h>
>  #include <linux/blkpg.h>
>  #include <linux/bio.h>
> @@ -2926,17 +2927,25 @@ EXPORT_SYMBOL_GPL(dm_internal_resume_fas
>  int dm_kobject_uevent(struct mapped_device *md, enum kobject_action action,
>  		       unsigned cookie)
>  {
> +	int r;
> +	unsigned noio_flag;
>  	char udev_cookie[DM_COOKIE_LENGTH];
>  	char *envp[] = { udev_cookie, NULL };
>  
> +	noio_flag = memalloc_noio_save();
> +
>  	if (!cookie)
> -		return kobject_uevent(&disk_to_dev(md->disk)->kobj, action);
> +		r = kobject_uevent(&disk_to_dev(md->disk)->kobj, action);
>  	else {
>  		snprintf(udev_cookie, DM_COOKIE_LENGTH, "%s=%u",
>  			 DM_COOKIE_ENV_VAR_NAME, cookie);
> -		return kobject_uevent_env(&disk_to_dev(md->disk)->kobj,
> -					  action, envp);
> +		r = kobject_uevent_env(&disk_to_dev(md->disk)->kobj,
> +				       action, envp);
>  	}
> +
> +	memalloc_noio_restore(noio_flag);
> +
> +	return r;
>  }
>  
>  uint32_t dm_next_uevent_seq(struct mapped_device *md)
>

-- 
Gabriel Krisman Bertazi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

