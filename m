Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 183F9AB401
	for <lists+dm-devel@lfdr.de>; Fri,  6 Sep 2019 10:28:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E3A1301A3E3;
	Fri,  6 Sep 2019 08:28:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 547F4600CC;
	Fri,  6 Sep 2019 08:28:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84533180221E;
	Fri,  6 Sep 2019 08:27:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x867jaRO002241 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Sep 2019 03:45:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F36B60C18; Fri,  6 Sep 2019 07:45:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 292CA60C5D
	for <dm-devel@redhat.com>; Fri,  6 Sep 2019 07:45:33 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63E303082B43
	for <dm-devel@redhat.com>; Fri,  6 Sep 2019 07:45:32 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i1so5445733edv.4
	for <dm-devel@redhat.com>; Fri, 06 Sep 2019 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=android.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zo7pH214UHwzpcJKHz+DSAZKUS6UbKLfm3ouHEw9TdY=;
	b=eLxc4P2GE5OEYYrsrSZcd7X16YU1qq8WWoRTUyYnrHQ79ArSd+KEhoY0mtL39f86Tu
	fFTIvKEk3XMAV+o7x2d/e7HmfX5PO5Dol5+343Uh4m08cmCvzWDlPvHXuwaAQMVvcOdO
	klTXJp+3I35x9Thh+9gMsuP5swWQp1WD3J3lVSXrtXDN9qf5JnuI4bjeu+vyjy11I+aB
	Lm0r2sHfuNffvOQv3dENiIUPC9g4/MArMpNJNVRHKTBIwAcN+Hv5oX8g+tpMnS5va2OV
	PMei5Jfu5ry5XHGKlSC42w/5BK61LuSnXtxgpV72kuOHL+uTF5ZjAxtXol7gTV6K4ynD
	CY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zo7pH214UHwzpcJKHz+DSAZKUS6UbKLfm3ouHEw9TdY=;
	b=mrdNR5F244b+Kj728eCvsGUs1Tx6M9xKZAbgbalseIRaHXcnwQAumv4dNSbJ/jAYnM
	rInNZJ/wfAMD3J0Sw0o6lGbqTAV9C2idSrQ7u2Yo/8bEfnTEISsm6sGlmckAhf0K0FjT
	c3OzEUZT+7r5AGB0wOyFYjg70U+0radjsQl7s20qtxzH1u/qP+rJngx6aS/mLI7gvGMT
	cw7tAm6WK9eZse8LMqSMkqalLt13gEgcsIOD2akNklLl/Im790eDGLRmQ5nc9vfhTnDs
	cEjOWr70RstjibIM9KS4e+jJuqWppAjuxa1jsdUeejiuSGqCUZ6qiMEUFCETXp8CY4MS
	WR2Q==
X-Gm-Message-State: APjAAAWxoFfzRTwKbIVgS/+iC5kOZroO2ibZAL/NAEDKMGyclk8GNMEH
	2sn2g3CjfEQsnw+k4T9AgUCELQ==
X-Google-Smtp-Source: APXvYqz5t2n0Cz3SWMqp+PJxO+EEtSxd7CrrMRDClS4OArRgLQd502XG8mJBe7tqpVJIgjUGwvRQVg==
X-Received: by 2002:a17:906:1903:: with SMTP id
	a3mr6146192eje.112.1567755930993; 
	Fri, 06 Sep 2019 00:45:30 -0700 (PDT)
Received: from maco2.ams.corp.google.com (a83-162-234-235.adsl.xs4all.nl.
	[83.162.234.235])
	by smtp.gmail.com with ESMTPSA id z65sm799136ede.86.2019.09.06.00.45.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 00:45:30 -0700 (PDT)
From: Martijn Coenen <maco@android.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Fri,  6 Sep 2019 09:45:26 +0200
Message-Id: <20190906074526.169194-1-maco@android.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 06 Sep 2019 07:45:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 06 Sep 2019 07:45:32 +0000 (UTC) for IP:'209.85.208.65'
	DOMAIN:'mail-ed1-f65.google.com' HELO:'mail-ed1-f65.google.com'
	FROM:'maco@android.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.208.65 mail-ed1-f65.google.com 209.85.208.65
	mail-ed1-f65.google.com <maco@android.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 06 Sep 2019 04:27:24 -0400
Cc: dariofreni@google.com, jiyong@google.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, maco@google.com,
	Martijn Coenen <maco@android.com>, ioffe@google.com,
	narayan@google.com, kernel-team@android.com
Subject: [dm-devel] [PATCH] dm-bufio: Allow clients to specify an upper
	bound on cache size.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 06 Sep 2019 08:28:07 +0000 (UTC)

The upper limit on the cache size of a client is currently determined by
dividing the total cache size by the number of clients. However, in some
cases it is beneficial to give one client a higher limit than others; an
example is a device with many dm-verity targets, where one target has a
very large hashtree, and all the others have a small hashtree. Giving
the target with the large hashtree a higher limit will be beneficial.
Another example is dm-verity-fec: FEC is only used in (rare) error
conditions, yet for every dm-verity target with FEC, we create two FEC
dm-bufio clients, which together have a higher cache limit than the
dm-verity target itself.

This patchset allows a client to indicate a maximum cache size for its
client; if that maximum is lower than the calculated per-client limit,
that maximum will be used instead, and the freed up cache size will be
allocated to other clients (that haven't set a maximum).

Note that this algorithm is not perfect; if we have 100MB with 3
clients, where the first set a max of 1MB, the second set a max of 40MB,
and the third set no maximumm, the ideal allocation would be 1:40:59,
respectively. However, because the initial per-client limit is 100 / 3
=~33MB, the requested max of 40MB is over the per-client limit, and
instead the allocation will end up being ~ 1:40:49. This is still better
than the original 33:33:33 allocation. An iterative algorithm could do
better, but it also complicates the code significantly.

Signed-off-by: Martijn Coenen <maco@android.com>
---
 drivers/md/dm-bufio.c    | 60 +++++++++++++++++++++++++++++++++++++---
 include/linux/dm-bufio.h |  7 +++++
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index b6b5acc92ca2d..d116030107c54 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -25,9 +25,20 @@
  * Memory management policy:
  *	Limit the number of buffers to DM_BUFIO_MEMORY_PERCENT of main memory
  *	or DM_BUFIO_VMALLOC_PERCENT of vmalloc memory (whichever is lower).
- *	Always allocate at least DM_BUFIO_MIN_BUFFERS buffers.
- *	Start background writeback when there are DM_BUFIO_WRITEBACK_PERCENT
- *	dirty buffers.
+ *
+ *	By default, all clients have an equal memory limit, which is the total
+ *	cache size divided by the number of clients. On devices with few
+ *	clients, this can be quite a large amount, and clients that know an
+ *	upper bound on their desired cache size can call
+ *	dm_bufio_set_maximum_buffers() to indicate this, to allow more "needy"
+ *	clients to get higher limits. In that case, if the per-client memory
+ *	limit exceeds the requested maximum, we use the requested maximum
+ *	instead, and divide the freed up space evenly with other clients that
+ *	haven't requested a maximum.
+ *
+ *	Always allocate at least DM_BUFIO_MIN_BUFFERS buffers.  Start
+ *	background writeback when there are DM_BUFIO_WRITEBACK_PERCENT dirty
+ *	buffers.
  */
 #define DM_BUFIO_MIN_BUFFERS		8
 
@@ -98,6 +109,7 @@ struct dm_bufio_client {
 	unsigned need_reserved_buffers;
 
 	unsigned minimum_buffers;
+	unsigned maximum_buffers;
 
 	struct rb_root buffer_tree;
 	wait_queue_head_t free_buffer_wait;
@@ -310,6 +322,11 @@ static void adjust_total_allocated(unsigned char data_mode, long diff)
  */
 static void __cache_size_refresh(void)
 {
+	unsigned long max_cache_size_per_client;
+	unsigned long remaining_cache_size_to_divide;
+	struct dm_bufio_client *c;
+	unsigned int num_clients_to_divide = 0;
+
 	BUG_ON(!mutex_is_locked(&dm_bufio_clients_lock));
 	BUG_ON(dm_bufio_client_count < 0);
 
@@ -324,8 +341,22 @@ static void __cache_size_refresh(void)
 		dm_bufio_cache_size_latch = dm_bufio_default_cache_size;
 	}
 
-	dm_bufio_cache_size_per_client = dm_bufio_cache_size_latch /
+	remaining_cache_size_to_divide = dm_bufio_cache_size_latch;
+	max_cache_size_per_client = dm_bufio_cache_size_latch /
 					 (dm_bufio_client_count ? : 1);
+
+	list_for_each_entry(c, &dm_bufio_all_clients, client_list) {
+		unsigned long max = (unsigned long) c->maximum_buffers *
+			c->block_size;
+
+		if (max > 0 && max < max_cache_size_per_client)
+			remaining_cache_size_to_divide -= max;
+		else
+			num_clients_to_divide++;
+	}
+
+	dm_bufio_cache_size_per_client = remaining_cache_size_to_divide /
+					 (num_clients_to_divide ? : 1);
 }
 
 /*
@@ -928,6 +959,15 @@ static void __get_memory_limit(struct dm_bufio_client *c,
 	else
 		buffers /= c->block_size;
 
+	/*
+	 * Note that dm_bufio_cache_size_per_client already takes into account
+	 * clients requesting less than is available; but that means the
+	 * available cache size per client has increased, and if they were
+	 * below the per-client limit then, they will still be below the limit
+	 * now.
+	 */
+	if ((c->maximum_buffers > 0) && buffers > c->maximum_buffers)
+		buffers = c->maximum_buffers;
 	if (buffers < c->minimum_buffers)
 		buffers = c->minimum_buffers;
 
@@ -1450,6 +1490,17 @@ void dm_bufio_set_minimum_buffers(struct dm_bufio_client *c, unsigned n)
 }
 EXPORT_SYMBOL_GPL(dm_bufio_set_minimum_buffers);
 
+void dm_bufio_set_maximum_buffers(struct dm_bufio_client *c, unsigned n)
+{
+	mutex_lock(&dm_bufio_clients_lock);
+
+	c->maximum_buffers = n;
+	__cache_size_refresh();
+
+	mutex_unlock(&dm_bufio_clients_lock);
+}
+EXPORT_SYMBOL(dm_bufio_set_maximum_buffers);
+
 unsigned dm_bufio_get_block_size(struct dm_bufio_client *c)
 {
 	return c->block_size;
@@ -1664,6 +1715,7 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
 	c->need_reserved_buffers = reserved_buffers;
 
 	dm_bufio_set_minimum_buffers(c, DM_BUFIO_MIN_BUFFERS);
+	c->maximum_buffers = 0;
 
 	init_waitqueue_head(&c->free_buffer_wait);
 	c->async_write_error = 0;
diff --git a/include/linux/dm-bufio.h b/include/linux/dm-bufio.h
index 3c8b7d274bd9b..89f2f04c16ef2 100644
--- a/include/linux/dm-bufio.h
+++ b/include/linux/dm-bufio.h
@@ -136,6 +136,13 @@ void dm_bufio_forget(struct dm_bufio_client *c, sector_t block);
  */
 void dm_bufio_set_minimum_buffers(struct dm_bufio_client *c, unsigned n);
 
+/*
+ * Set the maximum number of buffers a client can hold. If called with a value
+ * of 0 (which is also the default), the maximum number of buffers is equal to
+ * the total cache size divided by the number of clients.
+ */
+void dm_bufio_set_maximum_buffers(struct dm_bufio_client *c, unsigned n);
+
 unsigned dm_bufio_get_block_size(struct dm_bufio_client *c);
 sector_t dm_bufio_get_device_size(struct dm_bufio_client *c);
 sector_t dm_bufio_get_block_number(struct dm_buffer *b);
-- 
2.23.0.162.g0b9fbb3734-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
