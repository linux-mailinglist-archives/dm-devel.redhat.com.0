Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 79C132FD07F
	for <lists+dm-devel@lfdr.de>; Wed, 20 Jan 2021 13:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611147552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zNQgLlKmvSmHhQnr39M49bmAyBJRJS7HJrDkx+3qJDo=;
	b=B0zfV9nUHgE+wKWgW8IzUSa5ROgrMDWcjMlsdTpBJW19Kgg5ONt1+TUdCkZn3ORYQOefAD
	jH3HGrV/V7e/ugLnCkqgdg8J74gse7sFw0Nftl+kuum4unaZmDBHPqzJ+JTeOlTQZ7qBkb
	5bk2C5Hw2WsqbGOs15ckEqtARScULto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-0Dw6ceyQMj2rKttg9PgGHw-1; Wed, 20 Jan 2021 07:59:10 -0500
X-MC-Unique: 0Dw6ceyQMj2rKttg9PgGHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D42E108E1AB;
	Wed, 20 Jan 2021 12:59:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A75605D6AD;
	Wed, 20 Jan 2021 12:59:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 415374BB7B;
	Wed, 20 Jan 2021 12:59:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10KCwRVV004823 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Jan 2021 07:58:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 893FC1A3D8; Wed, 20 Jan 2021 12:58:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23BE01F462;
	Wed, 20 Jan 2021 12:58:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 10KCwNfm012447; Wed, 20 Jan 2021 07:58:23 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 10KCwNPh012443; Wed, 20 Jan 2021 07:58:23 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 20 Jan 2021 07:58:23 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
Message-ID: <alpine.LRH.2.02.2101200758010.12379@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/2] dm-integrity: disable recalculate due to
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

Disable recalculating if we don't have fix_hmac, the journal hash
algorithm is using a kay and we don't have the "legacy_recalculate" flag.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -262,6 +262,7 @@ struct dm_integrity_c {
 	bool discard;
 	bool fix_padding;
 	bool fix_hmac;
+	bool legacy_recalculate;
 
 	struct alg_spec internal_hash_alg;
 	struct alg_spec journal_crypt_alg;
@@ -389,6 +390,15 @@ static int dm_integrity_failed(struct dm
 	return READ_ONCE(ic->failed);
 }
 
+static bool dm_integrity_disable_recalculate(struct dm_integrity_c *ic)
+{
+	if (!ic->fix_hmac &&
+	     ic->journal_mac_alg.key &&
+	    !ic->legacy_recalculate)
+		return true;
+	return false;
+}
+
 static commit_id_t dm_integrity_commit_id(struct dm_integrity_c *ic, unsigned i,
 					  unsigned j, unsigned char seq)
 {
@@ -3221,6 +3231,7 @@ static void dm_integrity_status(struct d
 		arg_count += !!ic->journal_mac_alg.alg_string;
 		arg_count += (ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_PADDING)) != 0;
 		arg_count += (ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_HMAC)) != 0;
+		arg_count += ic->legacy_recalculate;
 		DMEMIT("%s %llu %u %c %u", ic->dev->name, ic->start,
 		       ic->tag_size, ic->mode, arg_count);
 		if (ic->meta_dev)
@@ -3246,6 +3257,8 @@ static void dm_integrity_status(struct d
 			DMEMIT(" fix_padding");
 		if ((ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_HMAC)) != 0)
 			DMEMIT(" fix_hmac");
+		if (ic->legacy_recalculate)
+			DMEMIT(" legacy_recalculate");
 
 #define EMIT_ALG(a, n)							\
 		do {							\
@@ -3878,7 +3891,7 @@ static int dm_integrity_ctr(struct dm_ta
 	unsigned extra_args;
 	struct dm_arg_set as;
 	static const struct dm_arg _args[] = {
-		{0, 16, "Invalid number of feature args"},
+		{0, 17, "Invalid number of feature args"},
 	};
 	unsigned journal_sectors, interleave_sectors, buffer_sectors, journal_watermark, sync_msec;
 	bool should_write_sb;
@@ -4028,6 +4041,8 @@ static int dm_integrity_ctr(struct dm_ta
 			ic->fix_padding = true;
 		} else if (!strcmp(opt_string, "fix_hmac")) {
 			ic->fix_hmac = true;
+		} else if (!strcmp(opt_string, "legacy_recalculate")) {
+			ic->legacy_recalculate = true;
 		} else {
 			r = -EINVAL;
 			ti->error = "Invalid argument";
@@ -4331,6 +4346,14 @@ try_smaller_buffer:
 		}
 	}
 
+	if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING) &&
+	    le64_to_cpu(ic->sb->recalc_sector) < ic->provided_data_sectors &&
+	    dm_integrity_disable_recalculate(ic)) {
+		ti->error = "Recalculating with \"fix_hmac\" is disable for security reasons - if you really need it, use the argument \"legacy_recalculate\"";
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
@@ -128,9 +128,15 @@ internal_hash:algorithm(:key)	(the key i
 
 	You can use a crc algorithm (such as crc32), then integrity target
 	will protect the data against accidental corruption.
-	You can also use a hmac algorithm (for example
-	"hmac(sha256):0123456789abcdef"), in this mode it will provide
-	cryptographic authentication of the data without encryption.
+
+	In order to provide cryptographic authentication of the data
+	without encryption, you need:
+	* the kernel 5.12 and integritysetup 2.3.5
+	* specfiy internal_hash as a hmac function with a key, for example
+	  hmac(sha256):0123456789abcdef
+	* specify journal_hash as a hmac function with a key, for example
+	  hmac(sha256):0123456789abcdef
+	* specify the fix_hmac argument
 
 	When this argument is not used, the integrity tags are accepted
 	from an upper layer target, such as dm-crypt. The upper layer

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

