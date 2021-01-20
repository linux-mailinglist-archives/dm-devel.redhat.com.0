Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 885DF2FD8EF
	for <lists+dm-devel@lfdr.de>; Wed, 20 Jan 2021 19:59:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611169185;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rTd3D4nmBdgVKwIi1PzBKhmquDuwVMd5CwLoAOmi7yU=;
	b=FfAqS9Bjdz1xBPkl0QRCLG/8iP8lkPZrEWHA879PeilvMxXSDhqd3HWSPL+/uKxZ6w9p8F
	+/5MTSTqNxJNWAhU/IqqktjiEPlORWDrfVHTqmbYhvhSsRYb7290M5+YVkTUaME5eJpo+F
	6I5ekJrRA1QkpRE4xBLJJziISHb2Rxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-HnD6njtdOUue0YqICFmYQQ-1; Wed, 20 Jan 2021 13:59:43 -0500
X-MC-Unique: HnD6njtdOUue0YqICFmYQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0FB58066E8;
	Wed, 20 Jan 2021 18:59:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6435D767;
	Wed, 20 Jan 2021 18:59:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC5EB5002E;
	Wed, 20 Jan 2021 18:59:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KIxGaF019008 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 13:59:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F9DC61F38; Wed, 20 Jan 2021 18:59:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE1775D6AD;
	Wed, 20 Jan 2021 18:59:12 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 10KIxCnF016903; Wed, 20 Jan 2021 13:59:12 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 10KIxBGe016899; Wed, 20 Jan 2021 13:59:11 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 20 Jan 2021 13:59:11 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
Message-ID: <alpine.LRH.2.02.2101201355180.16623@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Laura Abbott <laura@labbott.name>, dm-devel@redhat.com, security@kernel.org,
	Alasdair Kergon <agk@redhat.com>,
	=?ISO-8859-15?Q?Daniel_Gl=F6ckner?= <dg@emlix.com>
Subject: [dm-devel] [PATCH v2 1/2] dm-integrity: disable recalculate due to
 secrurity reasons
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Disable recalculating if we use internal_hash or journal_hash with a key
and we don't have the "legacy_recalculate" flag.

This may break activations of volumes that were created by an older kernel
and that are not yet fully recalculated - if this happens, the user should
add the "legacy_recalculate" flag to constructor parameters.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reported-by: Daniel Glockner <dg@emlix.com>

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -257,8 +257,9 @@ struct dm_integrity_c {
 	bool journal_uptodate;
 	bool just_formatted;
 	bool recalculate_flag;
-	bool fix_padding;
 	bool discard;
+	bool fix_padding;
+	bool legacy_recalculate;
 
 	struct alg_spec internal_hash_alg;
 	struct alg_spec journal_crypt_alg;
@@ -386,6 +387,14 @@ static int dm_integrity_failed(struct dm
 	return READ_ONCE(ic->failed);
 }
 
+static bool dm_integrity_disable_recalculate(struct dm_integrity_c *ic)
+{
+	if ((ic->internal_hash_alg.key || ic->journal_mac_alg.key) &&
+	    !ic->legacy_recalculate)
+		return true;
+	return false;
+}
+
 static commit_id_t dm_integrity_commit_id(struct dm_integrity_c *ic, unsigned i,
 					  unsigned j, unsigned char seq)
 {
@@ -3140,6 +3149,7 @@ static void dm_integrity_status(struct d
 		arg_count += !!ic->journal_crypt_alg.alg_string;
 		arg_count += !!ic->journal_mac_alg.alg_string;
 		arg_count += (ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_PADDING)) != 0;
+		arg_count += ic->legacy_recalculate;
 		DMEMIT("%s %llu %u %c %u", ic->dev->name, ic->start,
 		       ic->tag_size, ic->mode, arg_count);
 		if (ic->meta_dev)
@@ -3163,6 +3173,8 @@ static void dm_integrity_status(struct d
 		}
 		if ((ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_PADDING)) != 0)
 			DMEMIT(" fix_padding");
+		if (ic->legacy_recalculate)
+			DMEMIT(" legacy_recalculate");
 
 #define EMIT_ALG(a, n)							\
 		do {							\
@@ -3792,7 +3804,7 @@ static int dm_integrity_ctr(struct dm_ta
 	unsigned extra_args;
 	struct dm_arg_set as;
 	static const struct dm_arg _args[] = {
-		{0, 15, "Invalid number of feature args"},
+		{0, 16, "Invalid number of feature args"},
 	};
 	unsigned journal_sectors, interleave_sectors, buffer_sectors, journal_watermark, sync_msec;
 	bool should_write_sb;
@@ -3940,6 +3952,8 @@ static int dm_integrity_ctr(struct dm_ta
 			ic->discard = true;
 		} else if (!strcmp(opt_string, "fix_padding")) {
 			ic->fix_padding = true;
+		} else if (!strcmp(opt_string, "legacy_recalculate")) {
+			ic->legacy_recalculate = true;
 		} else {
 			r = -EINVAL;
 			ti->error = "Invalid argument";
@@ -4243,6 +4257,14 @@ try_smaller_buffer:
 		}
 	}
 
+	if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING) &&
+	    le64_to_cpu(ic->sb->recalc_sector) < ic->provided_data_sectors &&
+	    dm_integrity_disable_recalculate(ic)) {
+		ti->error = "Recalculating with HMAC is disabled for security reasons - if you really need it, use the argument \"legacy_recalculate\"";
+		r = -EOPNOTSUPP;
+		goto bad;
+	}
+
 	ic->bufio = dm_bufio_client_create(ic->meta_dev ? ic->meta_dev->bdev : ic->dev->bdev,
 			1U << (SECTOR_SHIFT + ic->log2_buffer_sectors), 1, 0, NULL, NULL);
 	if (IS_ERR(ic->bufio)) {
Index: linux-2.6/Documentation/admin-guide/device-mapper/dm-integrity.rst
===================================================================
--- linux-2.6.orig/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ linux-2.6/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -177,14 +177,20 @@ bitmap_flush_interval:number
 	The bitmap flush interval in milliseconds. The metadata buffers
 	are synchronized when this interval expires.
 
+allow_discards
+	Allow block discard requests (a.k.a. TRIM) for the integrity device.
+	Discards are only allowed to devices using internal hash.
+
 fix_padding
 	Use a smaller padding of the tag area that is more
 	space-efficient. If this option is not present, large padding is
 	used - that is for compatibility with older kernels.
 
-allow_discards
-	Allow block discard requests (a.k.a. TRIM) for the integrity device.
-	Discards are only allowed to devices using internal hash.
+legacy_recalculate
+	Allow recalculating of volumes with HMAC keys. This is disabled by
+	default for security reasons - an attacker could modify the volume,
+	set recalc_sector to zero, and the kernel would not detect the
+	modification.
 
 The journal mode (D/J), buffer_sectors, journal_watermark, commit_time and
 allow_discards can be changed when reloading the target (load an inactive
integrity-hmac-superblock.patch

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

