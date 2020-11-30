Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DE8132C8B0C
	for <lists+dm-devel@lfdr.de>; Mon, 30 Nov 2020 18:31:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606757466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IEIMexpk+4bWD6/Fbu64YFMf9jUbM0kVBQP97bePMpA=;
	b=NMEzaV9crWsd8DzhyvYrC43pqQy35S02Ts7ymaKB1h+IEjdE4EF9YcUnJxL50auUd0QsFc
	1cckWGGuSolP9zyXYwQ1nUuYBn6eifv0SrW+4DyDjsDmm+kNbDh3mkWS2QFjJZEzl0eOrr
	bZ3T4FdyB3BW1KgOnh97dBOpf9QDVtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-chLY_-AnP06qIDYFDIjqlA-1; Mon, 30 Nov 2020 12:31:04 -0500
X-MC-Unique: chLY_-AnP06qIDYFDIjqlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37D378797DA;
	Mon, 30 Nov 2020 17:30:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2BA31346F;
	Mon, 30 Nov 2020 17:30:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A9D74BB7B;
	Mon, 30 Nov 2020 17:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUHUgBx004191 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 12:30:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6FB675DC09; Mon, 30 Nov 2020 17:30:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33A4A5D973;
	Mon, 30 Nov 2020 17:30:42 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0AUHUfiO020604; Mon, 30 Nov 2020 12:30:41 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0AUHUfsN020600; Mon, 30 Nov 2020 12:30:41 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 30 Nov 2020 12:30:41 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2011271240290.31117@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2011301217010.17848@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2011261003400.11630@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2011271240290.31117@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Ondrej Kozina <okozina@redhat.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH v3] dm-crypt: fix deadlock when swapping to
 encrypted device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

This is the third version of the "swapping on dm-crypt" patch. The only 
change is that we define MAX_BIOS inversely proportional to page size:

#define MAX_BIOS       (16 * 1048576 / PAGE_SIZE)

I tested it on a machine with 8GiB ram with swapping on disk and ssd - on 
ssd, the system didn't lock-up with increased number of bios, but when the 
limit was removed, it triggered OOM prematurely and killed the process 
that allocated memory.

On rotational disk, I got soft lockup at 32768 bios or more. With smaller 
values, the machine was still somehow responsive during swapping.



From: Mikulas Patocka <mpatocka@redhat.com>

The system would deadlock when swapping to a dm-crypt device. The reason
is that for each incoming write bio, dm-crypt allocates memory that holds
encrypted data. These excessive allocations exhaust all the memory and the
result is either deadlock or OOM trigger.

This patch limits the number of in-flight bios, so that the memory
consumed by dm-crypt is limited. If we are over the limit, we block in the
function crypt_map, so that the caller will not attempt to send more bios.

This is similar to request-based drivers - they will also block when the
number of bios is over the limit.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

Index: linux-2.6/drivers/md/dm-crypt.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-crypt.c
+++ linux-2.6/drivers/md/dm-crypt.c
@@ -214,16 +214,24 @@ struct crypt_config {
 	mempool_t page_pool;
 
 	struct bio_set bs;
+
+	int bio_limit;
+	struct semaphore bio_limit_semaphore;
+	struct mutex bio_limit_lock;
+
 	struct mutex bio_alloc_lock;
 
 	u8 *authenc_key; /* space for keys in authenc() format (if used) */
 	u8 key[];
 };
 
+#define MAX_BIOS	(16 * 1048576 / PAGE_SIZE)
 #define MIN_IOS		64
 #define MAX_TAG_SIZE	480
 #define POOL_ENTRY_SIZE	512
 
+static int bio_limit = MAX_BIOS;
+
 static DEFINE_SPINLOCK(dm_crypt_clients_lock);
 static unsigned dm_crypt_clients_n = 0;
 static volatile unsigned long dm_crypt_pages_per_client;
@@ -1713,6 +1721,8 @@ static void crypt_dec_pending(struct dm_
 		kfree(io->integrity_metadata);
 
 	base_bio->bi_status = error;
+	if (bio_data_dir(base_bio) == WRITE)
+		up(&cc->bio_limit_semaphore);
 	bio_endio(base_bio);
 }
 
@@ -2567,6 +2577,7 @@ static void crypt_dtr(struct dm_target *
 	kfree_sensitive(cc->cipher_auth);
 	kfree_sensitive(cc->authenc_key);
 
+	mutex_destroy(&cc->bio_limit_lock);
 	mutex_destroy(&cc->bio_alloc_lock);
 
 	/* Must zero key material before freeing */
@@ -3007,6 +3018,7 @@ static int crypt_ctr(struct dm_target *t
 	int key_size;
 	unsigned int align_mask;
 	unsigned long long tmpll;
+	int latch;
 	int ret;
 	size_t iv_size_padding, additional_req_size;
 	char dummy;
@@ -3106,6 +3118,12 @@ static int crypt_ctr(struct dm_target *t
 		goto bad;
 	}
 
+	latch = READ_ONCE(bio_limit);
+	if (unlikely(latch <= 0))
+		latch = MAX_BIOS;
+	cc->bio_limit = latch;
+	sema_init(&cc->bio_limit_semaphore, latch);
+	mutex_init(&cc->bio_limit_lock);
 	mutex_init(&cc->bio_alloc_lock);
 
 	ret = -EINVAL;
@@ -3234,6 +3252,25 @@ static int crypt_map(struct dm_target *t
 	if (unlikely(bio->bi_iter.bi_size & (cc->sector_size - 1)))
 		return DM_MAPIO_KILL;
 
+	if (bio_data_dir(bio) == WRITE) {
+		int latch = READ_ONCE(bio_limit);
+		if (unlikely(latch <= 0))
+			latch = MAX_BIOS;
+		if (unlikely(cc->bio_limit != latch)) {
+			mutex_lock(&cc->bio_limit_lock);
+			while (latch < cc->bio_limit) {
+				down(&cc->bio_limit_semaphore);
+				cc->bio_limit--;
+			}
+			while (latch > cc->bio_limit) {
+				up(&cc->bio_limit_semaphore);
+				cc->bio_limit++;
+			}
+			mutex_unlock(&cc->bio_limit_lock);
+		}
+		down(&cc->bio_limit_semaphore);
+	}
+
 	io = dm_per_bio_data(bio, cc->per_bio_data_size);
 	crypt_io_init(io, cc, bio, dm_target_offset(ti, bio->bi_iter.bi_sector));
 
@@ -3461,6 +3498,9 @@ static void __exit dm_crypt_exit(void)
 module_init(dm_crypt_init);
 module_exit(dm_crypt_exit);
 
+module_param_named(max_bios_in_flight, bio_limit, int, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(max_bios_in_flight, "maximum number of bios in flight");
+
 MODULE_AUTHOR("Jana Saout <jana@saout.de>");
 MODULE_DESCRIPTION(DM_NAME " target for transparent encryption / decryption");
 MODULE_LICENSE("GPL");

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

