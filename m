Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 35AC3112D3B
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 15:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575468489;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jVBY5vKprSzz2lrIL3D57V5OJ56ULJID2/+8akvWhJc=;
	b=i3RatXdGIEPF6+6pN8ePTNzeDSzxo+Lcd/AhbyPIb5BOFUU7jYluObt7FMrpkuGpKUlDEB
	RCj7kRDOU61JFZDrBWJQSiQeBFMgCIkfe3KQo/WSa3Q/YuM50VcnRygSURIpSpjNqtsEuF
	oUET30q+4+fwj6YCHjcg0RI6ow3sl1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-uonKjGQuN8uumswDtRD6Qw-1; Wed, 04 Dec 2019 09:08:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 513B685EE71;
	Wed,  4 Dec 2019 14:08:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6C31001938;
	Wed,  4 Dec 2019 14:08:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A099D5BC11;
	Wed,  4 Dec 2019 14:07:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E7tDH007094 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:07:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 73445117C02; Wed,  4 Dec 2019 14:07:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C931117C0D
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC21685A322
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:51 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-151-vd_qQIuQPRycGhmMla5bXA-1; Wed, 04 Dec 2019 09:07:49 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so8228055ljm.10
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 06:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y+JWdTPa/RdHtAEGW2Bkm+DIkQbGaryMawNNljcThNk=;
	b=E2l+2O0/8OH1k4IEPIoXpopxxE/fcOqOk5eHqsGGwYMjV7TlH02LXiYzfjDk7EcWpP
	c5XJi5dGrGOCFiLOujLf0Kb6UEcKIjFucyKtJC43hUMSb95nugR8MnfQ+dclwFzULA5L
	AFWOdmWsDhfdvVlQWq5OmisQQ337fReC5fKsEDiQByVdF8gKpRYynsCX/NxPehHmCY7I
	L/NyL4A1kFks2EuwFYfMazRVORQQtacS++oihhimVGSLqprB1ZkOzfM3+bwUflUGsmLF
	eOr5Mx5babYjh5nJVL3xrTATToKHRH2IKEIiCHJrvzBilmF22Fq64w24pwewMVGrU9eV
	R+gw==
X-Gm-Message-State: APjAAAVCykdWceQCqnNjgjDcX80y2aTQ0ZFtbbHWxCw6QegYIopgtDIy
	yufBwPxEU2FUCkpsiaYuRHvZWQ==
X-Google-Smtp-Source: APXvYqxMOspOXRAoqpm4wC2FMU0sy0gvKxCVhjQ+HdAnFemqBfHhzOHqWYWHQ7UZstomnQJ5T3A4Rw==
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr2117612ljc.84.1575468468309; 
	Wed, 04 Dec 2019 06:07:48 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id n3sm3350450lfk.61.2019.12.04.06.07.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 06:07:47 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed,  4 Dec 2019 16:07:42 +0200
Message-Id: <20191204140742.26273-3-ntsironis@arrikto.com>
In-Reply-To: <20191204140742.26273-1-ntsironis@arrikto.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
X-MC-Unique: vd_qQIuQPRycGhmMla5bXA-1
X-MC-Unique: uonKjGQuN8uumswDtRD6Qw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4E7tDH007094
X-loop: dm-devel@redhat.com
Cc: thornber@redhat.com, ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 2/2] dm thin: Flush data device before committing
	metadata
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The thin provisioning target maintains per thin device mappings that map
virtual blocks to data blocks in the data device.

When we write to a shared block, in case of internal snapshots, or
provision a new block, in case of external snapshots, we copy the shared
block to a new data block (COW), update the mapping for the relevant
virtual block and then issue the write to the new data block.

Suppose the data device has a volatile write-back cache and the
following sequence of events occur:

1. We write to a shared block
2. A new data block is allocated
3. We copy the shared block to the new data block using kcopyd (COW)
4. We insert the new mapping for the virtual block in the btree for that
   thin device.
5. The commit timeout expires and we commit the metadata, that now
   includes the new mapping from step (4).
6. The system crashes and the data device's cache has not been flushed,
   meaning that the COWed data are lost.

The next time we read that virtual block of the thin device we read it
from the data block allocated in step (2), since the metadata have been
successfully committed. The data are lost due to the crash, so we read
garbage instead of the old, shared data.

This has the following implications:

1. In case of writes to shared blocks, with size smaller than the pool's
   block size (which means we first copy the whole block and then issue
   the smaller write), we corrupt data that the user never touched.

2. In case of writes to shared blocks, with size equal to the device's
   logical block size, we fail to provide atomic sector writes. When the
   system recovers the user will read garbage from that sector instead
   of the old data or the new data.

3. Even for writes to shared blocks, with size equal to the pool's block
   size (overwrites), after the system recovers, the written sectors
   will contain garbage instead of a random mix of sectors containing
   either old data or new data, thus we fail again to provide atomic
   sectors writes.

4. Even when the user flushes the thin device, because we first commit
   the metadata and then pass down the flush, the same risk for
   corruption exists (if the system crashes after the metadata have been
   committed but before the flush is passed down to the data device.)

The only case which is unaffected is that of writes with size equal to
the pool's block size and with the FUA flag set. But, because FUA writes
trigger metadata commits, this case can trigger the corruption
indirectly.

Moreover, apart from internal and external snapshots, the same issue
exists for newly provisioned blocks, when block zeroing is enabled.
After the system recovers the provisioned blocks might contain garbage
instead of zeroes.

To solve this and avoid the potential data corruption we flush the
pool's data device **before** committing its metadata.

This ensures that the data blocks of any newly inserted mappings are
properly written to non-volatile storage and won't be lost in case of a
crash.

Cc: stable@vger.kernel.org
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-thin.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 5a2c494cb552..e0be545080d0 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -3180,6 +3180,34 @@ static void metadata_low_callback(void *context)
 	dm_table_event(pool->ti->table);
 }
 
+/*
+ * We need to flush the data device **before** committing the metadata.
+ *
+ * This ensures that the data blocks of any newly inserted mappings are
+ * properly written to non-volatile storage and won't be lost in case of a
+ * crash.
+ *
+ * Failure to do so can result in data corruption in the case of internal or
+ * external snapshots and in the case of newly provisioned blocks, when block
+ * zeroing is enabled.
+ */
+static int metadata_pre_commit_callback(void *context)
+{
+	struct pool_c *pt = context;
+	struct bio bio;
+	int r;
+
+	bio_init(&bio, NULL, 0);
+	bio_set_dev(&bio, pt->data_dev->bdev);
+	bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+
+	r = submit_bio_wait(&bio);
+
+	bio_uninit(&bio);
+
+	return r;
+}
+
 static sector_t get_dev_size(struct block_device *bdev)
 {
 	return i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
@@ -3374,6 +3402,10 @@ static int pool_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	if (r)
 		goto out_flags_changed;
 
+	dm_pool_register_pre_commit_callback(pt->pool->pmd,
+					     metadata_pre_commit_callback,
+					     pt);
+
 	pt->callbacks.congested_fn = pool_is_congested;
 	dm_table_add_target_callbacks(ti->table, &pt->callbacks);
 
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

