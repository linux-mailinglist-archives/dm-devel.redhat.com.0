Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D0A2F1699DC
	for <lists+dm-devel@lfdr.de>; Sun, 23 Feb 2020 20:56:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582487768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z4bWX5fPk8+j3UiiXrZTcr2uTyAtvIjhB2MGAaYVOuo=;
	b=KRvVwuo1t0XyviYrA/KMQbH6vTNT0NJWPGOmZowQhkzeyvpfLBF9Qd7d7hLd8FB0RtkRgf
	AknZbrpVI6rqn/pj70LYbILeSw6Pfvk/CJnjKKwLCCp68pG4pU2OBimWEqWJDvy+Werjgq
	NkaYxNlv03RTU9h82hI3tmWzA0dIMoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-j7oJmMCCOVWzwIIEkIivsg-1; Sun, 23 Feb 2020 14:56:06 -0500
X-MC-Unique: j7oJmMCCOVWzwIIEkIivsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72422800EB4;
	Sun, 23 Feb 2020 19:55:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59ECA5D9E2;
	Sun, 23 Feb 2020 19:55:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86D021809567;
	Sun, 23 Feb 2020 19:55:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01NJtDR3022944 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Feb 2020 14:55:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 95AE92063FE5; Sun, 23 Feb 2020 19:55:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 908C12026D68
	for <dm-devel@redhat.com>; Sun, 23 Feb 2020 19:55:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 644E0185A78E
	for <dm-devel@redhat.com>; Sun, 23 Feb 2020 19:55:11 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-38-7R_wd2lfPJWongd4ioVFtg-1; Sun, 23 Feb 2020 14:55:07 -0500
X-MC-Unique: 7R_wd2lfPJWongd4ioVFtg-1
Received: from callcc.thunk.org (guestnat-104-133-8-109.corp.google.com
	[104.133.8.109] (may be forged)) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 01NJt3a4029375
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 23 Feb 2020 14:55:04 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
	id E471B4211EF; Sun, 23 Feb 2020 14:55:02 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: dm-devel@redhat.com
Date: Sun, 23 Feb 2020 14:54:58 -0500
Message-Id: <20200223195458.1196339-1-tytso@mit.edu>
In-Reply-To: <20200220234519.GA620489@mit.edu>
References: <20200220234519.GA620489@mit.edu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01NJtDR3022944
X-loop: dm-devel@redhat.com
Cc: Theodore Ts'o <tytso@mit.edu>, snitzer@redhat.com, agk@redhat.com
Subject: [dm-devel] [PATCH] dm thin metadata: fix lockdep complaint
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[ 3934.173244] ======================================================
[ 3934.179572] WARNING: possible circular locking dependency detected
[ 3934.185884] 5.4.21-xfstests #1 Not tainted
[ 3934.190151] ------------------------------------------------------
[ 3934.196673] dmsetup/8897 is trying to acquire lock:
[ 3934.201688] ffffffffbce82b18 (shrinker_rwsem){++++}, at: unregister_shrinker+0x22/0x80
[ 3934.210268]
               but task is already holding lock:
[ 3934.216489] ffff92a10cc5e1d0 (&pmd->root_lock){++++}, at: dm_pool_metadata_close+0xba/0x120
[ 3934.225083]
               which lock already depends on the new lock.

[ 3934.564165] Chain exists of:
                 shrinker_rwsem --> &journal->j_checkpoint_mutex --> &pmd->root_lock

For a more detailed lockdep report, please see:

	https://lore.kernel.org/r/20200220234519.GA620489@mit.edu

We shouldn't need to hold the lock while are just tearing down and
freeing the whole metadata pool structure.

Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 drivers/md/dm-thin-metadata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index fc9947d6210c..76b6b323bf4b 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -960,9 +960,9 @@ int dm_pool_metadata_close(struct dm_pool_metadata *pmd)
 			DMWARN("%s: __commit_transaction() failed, error = %d",
 			       __func__, r);
 	}
+	pmd_write_unlock(pmd);
 	if (!pmd->fail_io)
 		__destroy_persistent_data_objects(pmd);
-	pmd_write_unlock(pmd);
 
 	kfree(pmd);
 	return 0;
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

