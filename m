Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 115101EBD31
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 15:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591105079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aalfDCQwPh4HB/XvzVkH6pP61Do9rUB23SGHPhgNUus=;
	b=dH84KA+IIORzZOVJAGW+soUcqcJ+SeZAKQMIg1Q9WcBTj4LaTBbs9BYLkny1hA7UG5SDdR
	tWqPKcwJ8/drKWdxiA8nlVSaxvg88SlqNhB1hS0HgwVx+6zEaOrXsvm2ANEPHZKKO6IF6K
	zbeaZ+Hjtc48hgqPd5IYNvwOQmajxT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-njUytFVqPWWWHVSGdF6uhw-1; Tue, 02 Jun 2020 09:37:56 -0400
X-MC-Unique: njUytFVqPWWWHVSGdF6uhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF932100CD09;
	Tue,  2 Jun 2020 13:37:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ADAB78EFF;
	Tue,  2 Jun 2020 13:37:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E16C93515;
	Tue,  2 Jun 2020 13:37:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052DZG9x007910 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 09:35:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61CFF78F04; Tue,  2 Jun 2020 13:35:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.194.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2389A6C776;
	Tue,  2 Jun 2020 13:35:16 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jg74T-0003XG-MX; Tue, 02 Jun 2020 15:35:14 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Tue, 02 Jun 2020 15:35:13 +0200
Message-Id: <20200602133513.046607000@debian-a64.vm>
User-Agent: quilt/0.65
Date: Tue, 02 Jun 2020 15:34:41 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 3/3] dm-ebs: use dm_bufio_forget_buffers
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
Content-Disposition: inline; filename=dm-ebs-forget-buffers.patch

Use dm_bufio_forget_buffers instead of block-by-block loop and
dm_bufio_forget. dm_bufio_forget_buffers is faster than the loop because
it searches for used buffers using rb-tree.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-ebs-target.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-ebs-target.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-ebs-target.c	2020-06-02 13:27:14.000000000 +0200
+++ linux-2.6/drivers/md/dm-ebs-target.c	2020-06-02 15:11:18.000000000 +0200
@@ -167,8 +167,8 @@ static void __ebs_forget_bio(struct ebs_
 	sector_t blocks, sector = bio->bi_iter.bi_sector;
 
 	blocks = __nr_blocks(ec, bio);
-	for (; blocks--; sector += ec->u_bs)
-		dm_bufio_forget(ec->bufio, __sector_to_block(ec, sector));
+
+	dm_bufio_forget_buffers(ec->bufio, __sector_to_block(ec, sector), blocks);
 }
 
 /* Worker funtion to process incoming bios. */

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

