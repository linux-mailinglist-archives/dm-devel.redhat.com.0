Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0087B170D1C
	for <lists+dm-devel@lfdr.de>; Thu, 27 Feb 2020 01:20:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582762804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z+wqNtMHoIBJzohm8TwZFuM22M0aoild9L4bzKfi5tA=;
	b=DyiFRe3Va5phaD0+SnrbnJSmqLXoIbbnKjfk3ETSS3pjXMeDRwgtpfTr6WPr6qhDFpmsTb
	uRdZJ6wn6D2Nxbar3dL1nLcjizpcGBSqwtDmB65+I1XdjSLMK3PS+Flk+u25Jj18aMaSDn
	V6fwa5oBnXkuxJb0emQsm+BOUQN6e4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-sRflaCsoO8GajPPNCGGnWg-1; Wed, 26 Feb 2020 19:20:02 -0500
X-MC-Unique: sRflaCsoO8GajPPNCGGnWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF85B107ACC7;
	Thu, 27 Feb 2020 00:19:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91F8C1000325;
	Thu, 27 Feb 2020 00:19:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CA2E1809567;
	Thu, 27 Feb 2020 00:19:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01R0J1SP017232 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 19:19:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AD838108BFE; Thu, 27 Feb 2020 00:19:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9474112321
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 00:18:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BED18867455
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 00:18:59 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-66-J_8COaJbPOSMqOQJUnE45w-1; Wed, 26 Feb 2020 19:18:54 -0500
X-MC-Unique: J_8COaJbPOSMqOQJUnE45w-1
IronPort-SDR: qF6cW/L/a7Z4Nm26DNYJxlAeoQcyhWs7uvEqG7LRJ1uaO/y3bmJKUcFkjbNkdpJ7Z7DPXTop5Y
	liu8ya5SLgdbcQZvztsrrFEEa1T3Un7kT6zSzpxXBTYR0hpXLgTwTMi/YMzJr4na3AdkxwE3A0
	LdJ+GOurLxUe+IiRZabyOG2xAc2VPqEjeOfktrmPJD1SKxfiND0uRh9a7j1k3esI2mf5QWeNr1
	d8vh7RZCghQth15f76ZQTn+LTZS8DRIr68u/maWn+3AwrciFTr8bvsmLLuv5Dd5UdgBYHNJiu2
	jkw=
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="130845318"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 27 Feb 2020 08:18:53 +0800
IronPort-SDR: 7WVPdZgJay1B+q8d7zRlaRTJPQWRkOUe2jFn3/QLJc7cG/ZB38iY6yq7hMRjm/u3p4EIWD6LN2
	jzpDAwMyFGLoeXSrTUPcyiWK/Bknq37HhxlkB284K6fuGpzncHthUIiJRI/XSIOd4YDkCN/16z
	stqAzbDeNex78QdgiFsILAxG0DJD49dM6ax3whT5WWI68l3aAnTTmcnMyIfCINL7wrEBGGEj8B
	mEnPG8VlCjhKRhtw9WFRwKI715etOWj64E9CSD8VjcWjRN0isELV+sRB5zV8Uo7NO58ydVmyg4
	7lL1uzRHorvxFA6MWjujozZZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	26 Feb 2020 16:11:18 -0800
IronPort-SDR: r3gI9J4pA1k2pUra+k8h41PvM9y0+G4CxUXAIgS0PmkZcF5onX2I63r/iU2JWg7K4+4PlGytKa
	mvkGPQbBg/Z3iaNCPB8E21yl498oqIF6QcnVWvVQBfCpF7iyiPKbm0IUWO78xIMXQMQDXxyb/+
	nSQIJzWHyhjCOzZa4RP/umMv8taaNJFwZQLGFS6Vjlh8NnmPshrI6YAj7bAewlxGesi/b99HT1
	/Ag13H3HjBANf8NUgRd6kEBdY5YvylR0TZh3X8uwv2WAaQgs4WfmqgZka7gQ8JKthkSilS386p
	9NU=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
	([10.149.53.87])
	by uls-op-cesaip02.wdc.com with ESMTP; 26 Feb 2020 16:18:52 -0800
From: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 27 Feb 2020 09:18:52 +0900
Message-Id: <20200227001852.287194-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01R0J1SP017232
X-loop: dm-devel@redhat.com
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: [dm-devel] [PATCH] dm zoned: Fix reference counter initial value of
	chunk works
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

Dm-zoned initializes reference counters of new chunk works with zero
value and refcount_inc() is called to increment the counter. However, the
refcount_inc() function handles the addition to zero value as an error
and triggers the warning as follows:

refcount_t: addition on 0; use-after-free.
WARNING: CPU: 7 PID: 1506 at lib/refcount.c:25 refcount_warn_saturate+0x68/0xf0
Modules linked in: dm_zoned bridge stp llc rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache nf_conntrack_netbios_ns nf_o
CPU: 7 PID: 1506 Comm: systemd-udevd Not tainted 5.4.0+ #134
...
Call Trace:
 dmz_map+0x2d2/0x350 [dm_zoned]
 __map_bio+0x42/0x1a0
 __split_and_process_non_flush+0x14a/0x1b0
 __split_and_process_bio+0x83/0x240
 ? kmem_cache_alloc+0x165/0x220
 dm_process_bio+0x90/0x230
 ? generic_make_request_checks+0x2e7/0x680
 dm_make_request+0x3e/0xb0
 generic_make_request+0xcf/0x320
 ? memcg_drain_all_list_lrus+0x1c0/0x1c0
 submit_bio+0x3c/0x160
 ? guard_bio_eod+0x2c/0x130
 mpage_readpages+0x182/0x1d0
 ? bdev_evict_inode+0xf0/0xf0
 read_pages+0x6b/0x1b0
 __do_page_cache_readahead+0x1ba/0x1d0
 force_page_cache_readahead+0x93/0x100
 generic_file_read_iter+0x83a/0xe40
 ? __seccomp_filter+0x7b/0x670
 new_sync_read+0x12a/0x1c0
 vfs_read+0x9d/0x150
 ksys_read+0x5f/0xe0
 do_syscall_64+0x5b/0x180
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
...

After this warning, following refcount API calls for the counter all fail
to change the counter value.

Fix this by setting the initial reference counter value not zero but one
for the new chunk works. Instead, do not call refcount_inc() via
dmz_get_chunk_work() for the new chunks works.

The failure was observed with linux version 5.4 with CONFIG_REFCOUNT_FULL
enabled. Refcount rework was merged to linux version 5.5 by the
commit 168829ad09ca ("Merge branch 'locking-core-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip"). After this
commit, CONFIG_REFCOUNT_FULL was removed and the failure was observed
regardless of kernel configuration.

Linux version 4.20 merged the commit 092b5648760a ("dm zoned: target: use
refcount_t for dm zoned reference counters"). Before this commit, dm
zoned used atomic_t APIs which does not check addition to zero, then this
fix is not necessary.

Fixes: 092b5648760a ("dm zoned: target: use refcount_t for dm zoned reference counters")
Cc: stable@vger.kernel.org # 5.5
Cc: stable@vger.kernel.org # 5.4
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/md/dm-zoned-target.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 70a1063161c0..b1e64cd31647 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -533,8 +533,9 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 
 	/* Get the BIO chunk work. If one is not active yet, create one */
 	cw = radix_tree_lookup(&dmz->chunk_rxtree, chunk);
-	if (!cw) {
-
+	if (cw) {
+		dmz_get_chunk_work(cw);
+	} else {
 		/* Create a new chunk work */
 		cw = kmalloc(sizeof(struct dm_chunk_work), GFP_NOIO);
 		if (unlikely(!cw)) {
@@ -543,7 +544,7 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 		}
 
 		INIT_WORK(&cw->work, dmz_chunk_work);
-		refcount_set(&cw->refcount, 0);
+		refcount_set(&cw->refcount, 1);
 		cw->target = dmz;
 		cw->chunk = chunk;
 		bio_list_init(&cw->bio_list);
@@ -556,7 +557,6 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 	}
 
 	bio_list_add(&cw->bio_list, bio);
-	dmz_get_chunk_work(cw);
 
 	dmz_reclaim_bio_acc(dmz->reclaim);
 	if (queue_work(dmz->chunk_wq, &cw->work))
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

