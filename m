Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 90EE820F78B
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-PyJ3pMiXOme8auGpdJaEwA-1; Tue, 30 Jun 2020 10:49:13 -0400
X-MC-Unique: PyJ3pMiXOme8auGpdJaEwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B00748015F8;
	Tue, 30 Jun 2020 14:49:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49F525C1B0;
	Tue, 30 Jun 2020 14:49:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB01D1809561;
	Tue, 30 Jun 2020 14:48:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNiioP020443 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:44:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 717502156A4F; Mon, 29 Jun 2020 23:44:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C0B52157F25
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51FF11049842
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:44:44 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-kCxXWwfiPROrTKHJkCXbHA-1; Mon, 29 Jun 2020 19:44:42 -0400
X-MC-Unique: kCxXWwfiPROrTKHJkCXbHA-1
IronPort-SDR: AUitZF6r3OyDfNSSHprUMq5WtQWVegJjMxMgSLN9GcbcabJj6CbUyRlKkAzswgdwHLFDVPrQKm
	Fd/BwwlCLnwXvVpe5tMU9AYYVlufhikGzkg12BU2ER2sUN4BhvxZKW9fYG8xwWZcrhQoo/+VgD
	Ef6opyMesO+9RopSfAaCm3shX/QVXrTx9iTODTB0OnjaU8sj+wKFlvp/bDxv8isSLzAbA9rUA5
	ozOYSs3lkZgNWQnF+D8xwaK14uVUgohS489phWTExX8HT0S9cE/73IRa9PNIOM6z1eGxt8KuV0
	SrQ=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="250451423"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:43:36 +0800
IronPort-SDR: 4i6qqe0lIJevTejfqQI7X6ADF0LJ53JX9JaoTV8e/SrR2kxnSCOWv3eb6D5Zlqj06QyfpmtH7h
	/HFGp5WXSoTAG25uQE+dLs34+1WJJ9eCI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:31:56 -0700
IronPort-SDR: TxSS+fRz0Jce2zgM3RsllAdgIl3rG5wnJxH46xqhp7x9Qs8459WU1bBxhoOsNSoV8SD7hkEBrG
	UuIG+hqqogAA==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:43:36 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:05 -0700
Message-Id: <20200629234314.10509-3-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	fangguoju@gmail.com, rdunlap@infradead.org, rostedt@goodmis.org,
	ming.lei@redhat.com, mingo@redhat.com, colyli@suse.de,
	jack@suse.czi, hch@lst.de, agk@redhat.com, bvanassche@acm.org
Subject: [dm-devel] [PATCH 02/11] block: rename block_bio_merge class to
	block_bio
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

There are identical TRACE_EVENTS presents which can now take an
advantage of the block_bio_merge trace event class.

This is a prep patch which renames block_bio_merge to block_bio so
that the next patches in this series will be able to resue it.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 include/trace/events/block.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/trace/events/block.h b/include/trace/events/block.h
index 237d40a48429..b5be387c4115 100644
--- a/include/trace/events/block.h
+++ b/include/trace/events/block.h
@@ -295,7 +295,7 @@ TRACE_EVENT(block_bio_complete,
 		  __entry->nr_sector, __entry->error)
 );
 
-DECLARE_EVENT_CLASS(block_bio_merge,
+DECLARE_EVENT_CLASS(block_bio,
 
 	TP_PROTO(struct bio *bio),
 
@@ -330,7 +330,7 @@ DECLARE_EVENT_CLASS(block_bio_merge,
  * Merging block request @bio to the end of an existing block request
  * in queue.
  */
-DEFINE_EVENT(block_bio_merge, block_bio_backmerge,
+DEFINE_EVENT(block_bio, block_bio_backmerge,
 
 	TP_PROTO(struct bio *bio),
 
@@ -344,7 +344,7 @@ DEFINE_EVENT(block_bio_merge, block_bio_backmerge,
  * Merging block IO operation @bio to the beginning of an existing block
  * operation in queue.
  */
-DEFINE_EVENT(block_bio_merge, block_bio_frontmerge,
+DEFINE_EVENT(block_bio, block_bio_frontmerge,
 
 	TP_PROTO(struct bio *bio),
 
-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

