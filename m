Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 967962E750A
	for <lists+dm-devel@lfdr.de>; Tue, 29 Dec 2020 23:58:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-kaX8gF9QMdaBrNlhg8fYCA-1; Tue, 29 Dec 2020 17:58:37 -0500
X-MC-Unique: kaX8gF9QMdaBrNlhg8fYCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7DCE180A086;
	Tue, 29 Dec 2020 22:58:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9A851DB;
	Tue, 29 Dec 2020 22:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44D504BB7B;
	Tue, 29 Dec 2020 22:58:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BTMvuHJ021593 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Dec 2020 17:57:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 558614E623; Tue, 29 Dec 2020 22:57:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FC224E3DB
	for <dm-devel@redhat.com>; Tue, 29 Dec 2020 22:57:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCE29800B3B
	for <dm-devel@redhat.com>; Tue, 29 Dec 2020 22:57:53 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-19-FHKtiHp-O5qWKwOccMNJPg-1; Tue, 29 Dec 2020 17:57:51 -0500
X-MC-Unique: FHKtiHp-O5qWKwOccMNJPg-1
Received: by mail-wr1-f41.google.com with SMTP id a12so15983688wrv.8
	for <dm-devel@redhat.com>; Tue, 29 Dec 2020 14:57:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e8TFEw00rWtQXffgF36zcsGhL/9hO4AHxOAS1ZYEkfY=;
	b=ScvV4lT3c9s4LyRaZKNfyVpjrMVUNEi8d1Nw5QXyGYi6bnD0YLDzu8Uf0Uj7zgD76C
	soG/yom7RoCaJYzy7K6NCIRIj4YkMhqyc83QzU1r3IICEtB3tQkOKM+Nv6F355vaJjpL
	qVOJ2wF1NkjBguwkt1+aC12Meb6uSGE/QdBAcqKycvg9ki9DMsaxq3CWqRD5IOUqtHDI
	cz94tdD2pQEja58sKfjVOkwbUpWxtHs+929hOoIbygiPqOa8JUau7JJJui/AT/LIQE/Q
	FbtNskaAvFu9JYPyFrxGBEXN4RaFdABkwsOd3MddmcgksPXSWLD/eQyADZJhYyYpuTus
	MRWQ==
X-Gm-Message-State: AOAM530WT/6M5EtgGHBHBpPf0VWhU24ecKzdI9xvbsaukP7P+TljXhPY
	7ECdKUo/73G5xh23ssj+gtQKLQ==
X-Google-Smtp-Source: ABdhPJyYDCuz3OY8+7fCHcACD+/27x1dAGxPrTfvvZZ1SyOe6zNceO9rigoVNoqSwjLxzmduf1T35g==
X-Received: by 2002:adf:f681:: with SMTP id v1mr57198140wrp.133.1609282669802; 
	Tue, 29 Dec 2020 14:57:49 -0800 (PST)
Received: from dev.cfops.net (165.176.200.146.dyn.plus.net. [146.200.176.165])
	by smtp.gmail.com with ESMTPSA id
	u205sm5182840wme.42.2020.12.29.14.57.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Dec 2020 14:57:48 -0800 (PST)
From: Ignat Korchagin <ignat@cloudflare.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org
Date: Tue, 29 Dec 2020 22:57:13 +0000
Message-Id: <20201229225714.1580-1-ignat@cloudflare.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, herbert@gondor.apana.org.au,
	kernel-team@cloudflare.com, nobuto.murata@canonical.com,
	stable@vger.kernel.org, josef@toxicpanda.com,
	ebiggers@kernel.org, clm@fb.com, mpatocka@redhat.com,
	Ignat Korchagin <ignat@cloudflare.com>, dsterba@suse.com,
	mail@maciej.szmigiero.name, linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 1/2] dm crypt: use GFP_ATOMIC when allocating
	crypto requests from softirq
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

Commit 39d42fa96ba1b7d2544db3f8ed5da8fb0d5cb877 made it possible for some code
paths in dm-crypt to be executed in softirq context, when the underlying driver
processes IO requests in interrupt/softirq context.

In this case sometimes when allocating a new crypto request we may get a
stacktrace like below:

[  210.103008][    C0] BUG: sleeping function called from invalid context at mm/mempool.c:381
[  210.104746][    C0] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 2602, name: fio
[  210.106599][    C0] CPU: 0 PID: 2602 Comm: fio Tainted: G        W         5.10.0+ #50
[  210.108331][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.0.0 02/06/2015
[  210.110212][    C0] Call Trace:
[  210.110921][    C0]  <IRQ>
[  210.111527][    C0]  dump_stack+0x7d/0xa3
[  210.112411][    C0]  ___might_sleep.cold+0x122/0x151
[  210.113527][    C0]  mempool_alloc+0x16b/0x2f0
[  210.114524][    C0]  ? __queue_work+0x515/0xde0
[  210.115553][    C0]  ? mempool_resize+0x700/0x700
[  210.116586][    C0]  ? crypt_endio+0x91/0x180
[  210.117479][    C0]  ? blk_update_request+0x757/0x1150
[  210.118513][    C0]  ? blk_mq_end_request+0x4b/0x480
[  210.119572][    C0]  ? blk_done_softirq+0x21d/0x340
[  210.120628][    C0]  ? __do_softirq+0x190/0x611
[  210.121626][    C0]  crypt_convert+0x29f9/0x4c00
[  210.122668][    C0]  ? _raw_spin_lock_irqsave+0x87/0xe0
[  210.123824][    C0]  ? kasan_set_track+0x1c/0x30
[  210.124858][    C0]  ? crypt_iv_tcw_ctr+0x4a0/0x4a0
[  210.125930][    C0]  ? kmem_cache_free+0x104/0x470
[  210.126973][    C0]  ? crypt_endio+0x91/0x180
[  210.127947][    C0]  kcryptd_crypt_read_convert+0x30e/0x420
[  210.129165][    C0]  blk_update_request+0x757/0x1150
[  210.130231][    C0]  blk_mq_end_request+0x4b/0x480
[  210.131294][    C0]  blk_done_softirq+0x21d/0x340
[  210.132332][    C0]  ? _raw_spin_lock+0x81/0xd0
[  210.133289][    C0]  ? blk_mq_stop_hw_queue+0x30/0x30
[  210.134399][    C0]  ? _raw_read_lock_irq+0x40/0x40
[  210.135458][    C0]  __do_softirq+0x190/0x611
[  210.136409][    C0]  ? handle_edge_irq+0x221/0xb60
[  210.137447][    C0]  asm_call_irq_on_stack+0x12/0x20
[  210.138507][    C0]  </IRQ>
[  210.139118][    C0]  do_softirq_own_stack+0x37/0x40
[  210.140191][    C0]  irq_exit_rcu+0x110/0x1b0
[  210.141151][    C0]  common_interrupt+0x74/0x120
[  210.142171][    C0]  asm_common_interrupt+0x1e/0x40
[  210.143206][    C0] RIP: 0010:_aesni_enc1+0x65/0xb0
[  210.144313][    C0] Code: 38 dc c2 41 0f 28 52 d0 66 0f 38 dc c2 41 0f 28 52 e0 66 0f 38 dc c2 41 0f 28 52 f0 66 0f 38 dc c2 41 0f 28 12 66 0f 38 dc c2 <41> 0f 28 52 10 66 0f 38 dc c2 41 0f 28 52 20 66 0f 38 dc c2 41 0f
[  210.148542][    C0] RSP: 0018:ffff88810dbe6db0 EFLAGS: 00000286
[  210.149842][    C0] RAX: ffffffff9a90cdc0 RBX: 0000000000000000 RCX: 0000000000000200
[  210.151576][    C0] RDX: ffff888101e5f240 RSI: ffff888101e5f240 RDI: ffff8881111b5020
[  210.153339][    C0] RBP: ffff88810dbe6e20 R08: 0000000000000000 R09: 0000000000000020
[  210.155063][    C0] R10: ffff8881111b5090 R11: 1ffff11021b7cdcc R12: ffffffff9e87cd40
[  210.156791][    C0] R13: ffff8881111b5210 R14: ffff888101e5f0d8 R15: 0000000000000000
[  210.158497][    C0]  ? aesni_set_key+0x1e0/0x1e0
[  210.159523][    C0]  ? aesni_enc+0xf/0x20
[  210.160408][    C0]  ? glue_xts_req_128bit+0x181/0x6f0
[  210.161571][    C0]  ? aesni_set_key+0x1e0/0x1e0
[  210.162560][    C0]  ? glue_ctr_req_128bit+0x630/0x630
[  210.163706][    C0]  ? kasan_save_stack+0x37/0x50
[  210.164761][    C0]  ? kasan_save_stack+0x20/0x50
[  210.165786][    C0]  ? get_page_from_freelist+0x2052/0x36a0
[  210.167024][    C0]  ? __blkdev_direct_IO_simple+0x43b/0x7e0
[  210.168288][    C0]  ? blkdev_direct_IO+0xd16/0x1020
[  210.169396][    C0]  ? generic_file_direct_write+0x1a3/0x480
[  210.170648][    C0]  ? __generic_file_write_iter+0x1d9/0x530
[  210.171882][    C0]  ? blkdev_write_iter+0x20d/0x3e0
[  210.172954][    C0]  ? vfs_write+0x524/0x770
[  210.173889][    C0]  ? do_syscall_64+0x33/0x40
[  210.174859][    C0]  ? __zone_watermark_ok+0x340/0x340
[  210.175977][    C0]  ? crypt_convert+0x28b6/0x4c00
[  210.177079][    C0]  ? mempool_alloc+0x107/0x2f0
[  210.178096][    C0]  ? crypt_iv_tcw_ctr+0x4a0/0x4a0
[  210.179193][    C0]  ? bio_add_page+0x111/0x170
[  210.180251][    C0]  ? __bio_try_merge_page+0x480/0x480
[  210.181446][    C0]  ? bio_associate_blkg+0x6d/0x100
[  210.182558][    C0]  ? kcryptd_crypt_write_convert+0x5ea/0x980
[  210.183852][    C0]  ? crypt_map+0x5bf/0xc80
[  210.184838][    C0]  ? bio_clone_blkg_association+0x10e/0x2c0
[  210.186125][    C0]  ? __map_bio.isra.0+0x109/0x3f0
[  210.187204][    C0]  ? __split_and_process_non_flush+0x7f9/0xc50
[  210.188560][    C0]  ? __send_empty_flush+0x2d0/0x2d0
[  210.189697][    C0]  ? __part_start_io_acct+0x70/0x2d0
[  210.190842][    C0]  ? dm_submit_bio+0x4d8/0xe40
[  210.191845][    C0]  ? __split_and_process_non_flush+0xc50/0xc50
[  210.193201][    C0]  ? submit_bio_noacct+0x2b9/0xe50
[  210.194313][    C0]  ? blk_queue_enter+0x6d0/0x6d0
[  210.195372][    C0]  ? __bio_add_page+0x246/0x3d0
[  210.196418][    C0]  ? bio_iov_iter_get_pages+0x7dd/0xbe0
[  210.197611][    C0]  ? submit_bio+0xe2/0x460
[  210.198481][    C0]  ? submit_bio_noacct+0xe50/0xe50
[  210.199496][    C0]  ? free_unref_page_commit.constprop.0+0x130/0x330
[  210.200825][    C0]  ? __blkdev_direct_IO_simple+0x43b/0x7e0
[  210.202050][    C0]  ? bd_link_disk_holder+0x690/0x690
[  210.203239][    C0]  ? put_pages_list+0x210/0x210
[  210.204341][    C0]  ? scan_shadow_nodes+0xb0/0xb0
[  210.205472][    C0]  ? _raw_write_lock_irqsave+0xe0/0xe0
[  210.206698][    C0]  ? bd_may_claim+0xc0/0xc0
[  210.207715][    C0]  ? zero_user_segments.constprop.0+0x2e0/0x2e0
[  210.209092][    C0]  ? blkdev_direct_IO+0xd16/0x1020
[  210.210200][    C0]  ? pagevec_lookup_range_tag+0x28/0x60
[  210.211416][    C0]  ? __filemap_fdatawait_range+0xc4/0x1f0
[  210.212669][    C0]  ? page_cache_next_miss+0x1e0/0x1e0
[  210.213842][    C0]  ? generic_file_buffered_read+0x520/0x9e0
[  210.215128][    C0]  ? delete_from_page_cache_batch+0x850/0x850
[  210.216470][    C0]  ? bd_abort_claiming+0xd0/0xd0
[  210.217531][    C0]  ? file_remove_privs+0x74/0x430
[  210.218589][    C0]  ? filemap_check_errors+0x50/0xe0
[  210.219705][    C0]  ? generic_file_direct_write+0x1a3/0x480
[  210.220979][    C0]  ? __generic_file_write_iter+0x1d9/0x530
[  210.222238][    C0]  ? blkdev_write_iter+0x20d/0x3e0
[  210.223328][    C0]  ? bd_unlink_disk_holder+0x360/0x360
[  210.224464][    C0]  ? new_sync_write+0x37b/0x620
[  210.225511][    C0]  ? new_sync_read+0x610/0x610
[  210.226539][    C0]  ? _cond_resched+0x17/0x80
[  210.227539][    C0]  ? inode_security+0x58/0x100
[  210.228582][    C0]  ? security_file_permission+0x54/0x450
[  210.229796][    C0]  ? vfs_write+0x524/0x770
[  210.230758][    C0]  ? __x64_sys_pwrite64+0x197/0x1f0
[  210.231890][    C0]  ? vfs_write+0x770/0x770
[  210.232869][    C0]  ? do_syscall_64+0x33/0x40
[  210.233839][    C0]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fix this by allocating crypto requests with GFP_ATOMIC mask in interrupt context

Fixes: 39d42fa96ba1 ("dm crypt: add flags to optionally bypass kcryptd workqueues")
Reported-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
Cc: <stable@vger.kernel.org> # v5.9+
Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
---
 drivers/md/dm-crypt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 5f9f9b3a226d..777b5c71a2f7 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1460,7 +1460,7 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
 	unsigned key_index = ctx->cc_sector & (cc->tfms_count - 1);
 
 	if (!ctx->r.req)
-		ctx->r.req = mempool_alloc(&cc->req_pool, GFP_NOIO);
+		ctx->r.req = mempool_alloc(&cc->req_pool, in_interrupt() ? GFP_ATOMIC : GFP_NOIO);
 
 	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
 
@@ -1477,7 +1477,7 @@ static void crypt_alloc_req_aead(struct crypt_config *cc,
 				 struct convert_context *ctx)
 {
 	if (!ctx->r.req_aead)
-		ctx->r.req_aead = mempool_alloc(&cc->req_pool, GFP_NOIO);
+		ctx->r.req_aead = mempool_alloc(&cc->req_pool, in_interrupt() ? GFP_ATOMIC : GFP_NOIO);
 
 	aead_request_set_tfm(ctx->r.req_aead, cc->cipher_tfm.tfms_aead[0]);
 
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

