Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3D715EBD
	for <lists+dm-devel@lfdr.de>; Tue, 30 May 2023 14:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685448952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EifVWMRVv4wpu60pDRb+BcayswVlNmuEgOl8VFRNTAw=;
	b=PHygeo/3PVqvyJypq6tH4PcEqxMhVW+8jF2boj7dgrAtWbuVG8sFpUlgSQf7Mkz8gahTvI
	mdXLfzgvF0+rkLkB8obX6G70WuG2dJuXO3xncIe4Ay/GyLrNCnKn5kRw6fSgaWu5856YaY
	rb9pNPaJmXFg+TRl91oGIDAb8CUyVdI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-EqXyf3xlPHiXIO3e_VYAkA-1; Tue, 30 May 2023 08:15:50 -0400
X-MC-Unique: EqXyf3xlPHiXIO3e_VYAkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36A0B3C0C891;
	Tue, 30 May 2023 12:15:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 077302166B25;
	Tue, 30 May 2023 12:15:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9521F19465B7;
	Tue, 30 May 2023 12:15:43 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A76FC1946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 30 May 2023 12:15:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CBCB112132D; Tue, 30 May 2023 12:15:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63434112132C;
 Tue, 30 May 2023 12:15:41 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 34UCFfYp013621; Tue, 30 May 2023 08:15:41 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 34UCFfL8013617; Tue, 30 May 2023 08:15:41 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 30 May 2023 08:15:41 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <alpine.LRH.2.21.2305300803220.12797@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH] bcachefs: fix NULL pointer dereference in
 try_alloc_bucket
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 29 May 2023, Mikulas Patocka wrote:

> The oops happens in set_btree_iter_dontneed and it is caused by the fact 
> that iter->path is NULL. The code in try_alloc_bucket is buggy because it 
> sets "struct btree_iter iter = { NULL };" and then jumps to the "err" 
> label that tries to dereference values in "iter".

Here I'm sending a patch for it.



From: Mikulas Patocka <mpatocka@redhat.com>

The function try_alloc_bucket sets the variable "iter" to NULL and then
(on various error conditions) jumps to the label "err". On the "err"
label, it calls "set_btree_iter_dontneed" that tries to dereference
"iter->trans" and "iter->path".

So, we get an oops on error condition.

This patch fixes the crash by testing that iter.trans and iter.path is
non-zero before calling set_btree_iter_dontneed.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 fs/bcachefs/alloc_foreground.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: bcachefs/fs/bcachefs/alloc_foreground.c
===================================================================
--- bcachefs.orig/fs/bcachefs/alloc_foreground.c
+++ bcachefs/fs/bcachefs/alloc_foreground.c
@@ -371,7 +371,8 @@ static struct open_bucket *try_alloc_buc
 	if (!ob)
 		iter.path->preserve = false;
 err:
-	set_btree_iter_dontneed(&iter);
+	if (iter.trans && iter.path)
+		set_btree_iter_dontneed(&iter);
 	bch2_trans_iter_exit(trans, &iter);
 	printbuf_exit(&buf);
 	return ob;
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

