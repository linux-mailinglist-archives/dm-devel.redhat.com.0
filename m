Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id B924B18F920
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 17:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584979222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EbscWEe4sQWKpU9MN43NjOrsPVYp4z5f0VKMGXjwPO4=;
	b=bDXgoDTAMSWPrxANNskotCPO7yq9QOm0YC7gFOsZ4Xknylfo+qMDPtX7ojJIpqrcgJg6u6
	jjf0n5X6yShn9o9CYqyS7IF6SzSE9wTlQ/Eo7ZDTw33UMvuvYSY/nChBPK8FuHDrNwyMiX
	KG17mjGIFmfOtCjyRsrEiwBY2rbi/0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-8Hcmbh0XOUqS5TCDw_1u8w-1; Mon, 23 Mar 2020 12:00:18 -0400
X-MC-Unique: 8Hcmbh0XOUqS5TCDw_1u8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF74A101FC62;
	Mon, 23 Mar 2020 16:00:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB16394978;
	Mon, 23 Mar 2020 16:00:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6766318089C8;
	Mon, 23 Mar 2020 16:00:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NFwvBY004137 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 11:58:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6CB89194BB; Mon, 23 Mar 2020 15:58:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E158119C4F;
	Mon, 23 Mar 2020 15:58:49 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 02NFwnC0005246; Mon, 23 Mar 2020 11:58:49 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 02NFwnLG005243; Mon, 23 Mar 2020 11:58:49 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 23 Mar 2020 11:58:49 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Gabriel Krisman Bertazi <krisman@collabora.com>
In-Reply-To: <20200304163953.578311-1-krisman@collabora.com>
Message-ID: <alpine.LRH.2.02.2003231148560.30812@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200304163953.578311-1-krisman@collabora.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Tahsin Erdogan <tahsin@google.com>, snitzer@redhat.com,
	Khazhismel Kumykov <khazhy@google.com>, dm-devel@redhat.com,
	kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] iscsi: do not wait for IOs in dm shrinker
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

There are other cases where the kernel could issue or wait on I/O in a 
shrinker (for example in inode shrinker). Instead of fixing all these 
cases, you should fix the process giscsid to not issue an I/O when it is 
not safe.

For example, the lvm and dmeventd processes lock themselves in memory 
using mlock, to make sure that they won't generate I/Os when some device 
mapper targets are suspended - so you should use a similar thing in iscsi.

Another possibility is to set the flag PF_MEMALLOC_NOIO for the giscsid 
process - that will imply that all allocations done by this process have 
the GFP_NOIO flag set.

If still think that no shrinkers should issue I/O anytime, you should 
change the shrinker API (i.e. don't pass the gfp mask to shrinkers) and 
get this patch through the memory management maintainers.

Mikulas


On Wed, 4 Mar 2020, Gabriel Krisman Bertazi wrote:

> From: Tahsin Erdogan <tahsin@google.com>
> 
> If something goes wrong with an iscsi session, the problem is reported
> to giscsid via a netlink message. Then, giscsid tries to add a new device
> and destroy the old one. During old device destruction, the pending ios
> get completed with an error. Without destroying the device the io
> operations are stuck forever.
> 
> If dm shrinker is invoked with __GFP_IO, shrinker gets blocked waiting for
> the pending ios to complete. So, if the giscsid repair path ends up
> doing a memory allocation with __GFP_IO enabled, it could end up in a
> deadlock because the iscsi io cannot be completed until giscsid can do its
> job and giscsid cannot do its job until the io completes.
> 
> Even worse, the deadlock can also occur even if giscsid avoids __GFP_IO
> in all paths. For instance, if giscsid tries to grab a mutex held by
> another thread and that thread invokes the shrinker we again may enter a
> deadlock. Here is a scenario stitched from multiple bugs that
> demonstrates how the deadlock can occur:
> 
> iSCSI-write
>         holding: rx_queue_mutex
>         waiting: uevent_sock_mutex
> 
>         kobject_uevent_env+0x1bd/0x419
>         kobject_uevent+0xb/0xd
>         device_add+0x48a/0x678
>         scsi_add_host_with_dma+0xc5/0x22d
>         iscsi_host_add+0x53/0x55
>         iscsi_sw_tcp_session_create+0xa6/0x129
>         iscsi_if_rx+0x100/0x1247
>         netlink_unicast+0x213/0x4f0
>         netlink_sendmsg+0x230/0x3c0
> 
> iscsi_fail iscsi_conn_failure
>         waiting: rx_queue_mutex
> 
>         schedule_preempt_disabled+0x325/0x734
>         __mutex_lock_slowpath+0x18b/0x230
>         mutex_lock+0x22/0x40
>         iscsi_conn_failure+0x42/0x149
>         worker_thread+0x24a/0xbc0
> 
> EventManager_
>         holding: uevent_sock_mutex
>         waiting: dm_bufio_client->lock
> 
>         dm_bufio_lock+0xe/0x10
>         shrink+0x34/0xf7
>         shrink_slab+0x177/0x5d0
>         do_try_to_free_pages+0x129/0x470
>         try_to_free_mem_cgroup_pages+0x14f/0x210
>         memcg_kmem_newpage_charge+0xa6d/0x13b0
>         __alloc_pages_nodemask+0x4a3/0x1a70
>         fallback_alloc+0x1b2/0x36c
>         __kmalloc_node_track_caller+0xb9/0x10d0
>         __alloc_skb+0x83/0x2f0
>         kobject_uevent_env+0x26b/0x419
>         dm_kobject_uevent+0x70/0x79
>         dev_suspend+0x1a9/0x1e7
>         ctl_ioctl+0x3e9/0x411
>         dm_ctl_ioctl+0x13/0x17
>         do_vfs_ioctl+0xb3/0x460
>         SyS_ioctl+0x5e/0x90
> 
> MemcgReclaimerD"
>         holding: dm_bufio_client->lock
>         waiting: stuck io to finish (needs iscsi_fail thread to progress)
> 
>         schedule at ffffffffbd603618
>         io_schedule at ffffffffbd603ba4
>         do_io_schedule at ffffffffbdaf0d94
>         __wait_on_bit at ffffffffbd6008a6
>         out_of_line_wait_on_bit at ffffffffbd600960
>         wait_on_bit.constprop.10 at ffffffffbdaf0f17
>         __make_buffer_clean at ffffffffbdaf18ba
>         __cleanup_old_buffer at ffffffffbdaf192f
>         shrink at ffffffffbdaf19fd
>         do_shrink_slab at ffffffffbd6ec000
>         shrink_slab at ffffffffbd6ec24a
>         do_try_to_free_pages at ffffffffbd6eda09
>         try_to_free_mem_cgroup_pages at ffffffffbd6ede7e
>         mem_cgroup_resize_limit at ffffffffbd7024c0
>         mem_cgroup_write at ffffffffbd703149
>         cgroup_file_write at ffffffffbd6d9c6e
>         sys_write at ffffffffbd6662ea
>         system_call_fastpath at ffffffffbdbc34a2
> 
> Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Tahsin Erdogan <tahsin@google.com>
> Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  drivers/md/dm-bufio.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
> index 2d519c223562..4c4f80e894b6 100644
> --- a/drivers/md/dm-bufio.c
> +++ b/drivers/md/dm-bufio.c
> @@ -1516,18 +1516,16 @@ static void drop_buffers(struct dm_bufio_client *c)
>   * We may not be able to evict this buffer if IO pending or the client
>   * is still using it.  Caller is expected to know buffer is too old.
>   *
> - * And if GFP_NOFS is used, we must not do any I/O because we hold
> - * dm_bufio_clients_lock and we would risk deadlock if the I/O gets
> - * rerouted to different bufio client.
> + * We must not do any I/O because we hold dm_bufio_clients_lock and we
> + * would risk deadlock if the I/O gets rerouted to different bufio
> + * client.
>   */
> -static bool __try_evict_buffer(struct dm_buffer *b, gfp_t gfp)
> +static bool __try_evict_buffer(struct dm_buffer *b)
>  {
> -	if (!(gfp & __GFP_FS)) {
> -		if (test_bit(B_READING, &b->state) ||
> -		    test_bit(B_WRITING, &b->state) ||
> -		    test_bit(B_DIRTY, &b->state))
> -			return false;
> -	}
> +	if (test_bit(B_READING, &b->state) ||
> +	    test_bit(B_WRITING, &b->state) ||
> +	    test_bit(B_DIRTY, &b->state))
> +		return false;
>  
>  	if (b->hold_count)
>  		return false;
> @@ -1549,8 +1547,7 @@ static unsigned long get_retain_buffers(struct dm_bufio_client *c)
>  	return retain_bytes;
>  }
>  
> -static unsigned long __scan(struct dm_bufio_client *c, unsigned long nr_to_scan,
> -			    gfp_t gfp_mask)
> +static unsigned long __scan(struct dm_bufio_client *c, unsigned long nr_to_scan)
>  {
>  	int l;
>  	struct dm_buffer *b, *tmp;
> @@ -1561,7 +1558,7 @@ static unsigned long __scan(struct dm_bufio_client *c, unsigned long nr_to_scan,
>  
>  	for (l = 0; l < LIST_SIZE; l++) {
>  		list_for_each_entry_safe_reverse(b, tmp, &c->lru[l], lru_list) {
> -			if (__try_evict_buffer(b, gfp_mask))
> +			if (__try_evict_buffer(b))
>  				freed++;
>  			if (!--nr_to_scan || ((count - freed) <= retain_target))
>  				return freed;
> @@ -1578,12 +1575,10 @@ dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>  	unsigned long freed;
>  
>  	c = container_of(shrink, struct dm_bufio_client, shrinker);
> -	if (sc->gfp_mask & __GFP_FS)
> -		dm_bufio_lock(c);
> -	else if (!dm_bufio_trylock(c))
> +	if (!dm_bufio_trylock(c))
>  		return SHRINK_STOP;
>  
> -	freed  = __scan(c, sc->nr_to_scan, sc->gfp_mask);
> +	freed  = __scan(c, sc->nr_to_scan);
>  	dm_bufio_unlock(c);
>  	return freed;
>  }
> @@ -1811,7 +1806,7 @@ static void __evict_old_buffers(struct dm_bufio_client *c, unsigned long age_hz)
>  		if (!older_than(b, age_hz))
>  			break;
>  
> -		if (__try_evict_buffer(b, 0))
> +		if (__try_evict_buffer(b))
>  			count--;
>  
>  		cond_resched();
> -- 
> 2.25.0
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

