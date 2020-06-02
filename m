Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 013811EBD33
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 15:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591105088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qeC33Nho8RXhtzzzCS+wFzdARllqf/SBsH8eCNNV1ig=;
	b=dQfrkJXyvSb/309Q6VKRkqzdZ53y1IIrSLuAgch5uRprerhUIoBSvKUAnuMRg+UFQMlKzZ
	2+It7T/maSOrNxnRkT/E7tVxYsn3aCifEdlhVkZVol5ILMWqJuvZYEy6O3Y4v6Ekpt9/xT
	wsngTKJhBOzwdoVtLM8l7eL0kb/OkGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-_P1M_MgzNBakrVGJrduE6A-1; Tue, 02 Jun 2020 09:37:52 -0400
X-MC-Unique: _P1M_MgzNBakrVGJrduE6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 341BB80B727;
	Tue,  2 Jun 2020 13:37:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B84D0768C6;
	Tue,  2 Jun 2020 13:37:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1880F180954D;
	Tue,  2 Jun 2020 13:37:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052DZGJ7007917 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 09:35:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9968B10016DA; Tue,  2 Jun 2020 13:35:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.194.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0FF810013D7;
	Tue,  2 Jun 2020 13:35:13 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jg74R-0003XA-6q; Tue, 02 Jun 2020 15:35:12 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Tue, 02 Jun 2020 15:35:10 +0200
Message-Id: <20200602133510.561174480@debian-a64.vm>
User-Agent: quilt/0.65
Date: Tue, 02 Jun 2020 15:34:39 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 1/3] dm-bufio: clean up rbtree block ordering
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
Content-Disposition: inline; filename=dm-bufio-cleanup-tree.patch

dm-bufio use unnatural ordering in the rb-tree - blocks with smaller
nubmers were put to the right node and blocks with bigget numbers were put
to the left node.

This patch reverses the logic, so that i's natural.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2020-06-02 13:27:14.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2020-06-02 14:26:32.000000000 +0200
@@ -256,7 +256,7 @@ static struct dm_buffer *__find(struct d
 		if (b->block == block)
 			return b;
 
-		n = (b->block < block) ? n->rb_left : n->rb_right;
+		n = block < b->block ? n->rb_left : n->rb_right;
 	}
 
 	return NULL;
@@ -276,8 +276,8 @@ static void __insert(struct dm_bufio_cli
 		}
 
 		parent = *new;
-		new = (found->block < b->block) ?
-			&((*new)->rb_left) : &((*new)->rb_right);
+		new = b->block < found->block ?
+			&found->node.rb_left : &found->node.rb_right;
 	}
 
 	rb_link_node(&b->node, parent, new);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

