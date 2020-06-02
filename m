Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 437131EBAD6
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591098812;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QWB05NGTNUTp4i2iWV6N0icpCvJoCup4JUGOBahktE4=;
	b=hr8eKiQOI1eFy3aGFKS2BddX1xHLOmB78FnNrniR9VXyv0kwrhASGGJPw0opXzAJenprKv
	p7CT2eT/kKfD31dx30RQO8Gv40rp1KvknlaQxlp6H+fWpVH2+b1EGwSFuANRUGeS/JWLs1
	rg3gAbWA/Y3m7VfCCU0JM2MUrSmTwPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-kLT4-HjTOPGxaQGKwBZH8A-1; Tue, 02 Jun 2020 07:53:29 -0400
X-MC-Unique: kLT4-HjTOPGxaQGKwBZH8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD4331052502;
	Tue,  2 Jun 2020 11:53:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 335DCD0210;
	Tue,  2 Jun 2020 11:53:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 651F6941CA;
	Tue,  2 Jun 2020 11:53:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BrAx2031015 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:53:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0E125D9E2; Tue,  2 Jun 2020 11:53:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA67E5D9CC;
	Tue,  2 Jun 2020 11:53:07 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 052Br7gp025558; Tue, 2 Jun 2020 07:53:07 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 052Br5eN025554; Tue, 2 Jun 2020 07:53:05 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 2 Jun 2020 07:53:05 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>, 
	djeffery@redhat.com
In-Reply-To: <20200601160421.912555280@debian-a64.vm>
Message-ID: <alpine.LRH.2.02.2006020752170.25489@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200601160421.912555280@debian-a64.vm>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: guazhang@redhat.com, dm-devel@redhat.com, qat-linux@intel.com,
	jpittman@redhat.com, linux-crypto@vger.kernel.org
Subject: [dm-devel] [PATCH 5/4] dm-integrity: sleep and retry on allocation
	errors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-integrity: sleep and retry on allocation errors

Some hardware crypto drivers use GFP_ATOMIC allocations in the request
routine. These allocations can randomly fail - for example, they fail if
too many network packets are received.

If we propagated the failure up to the I/O stack, it would cause I/O
errors. So, we sleep and retry.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-integrity.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-04-05 21:11:02.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2020-06-02 13:49:36.000000000 +0200
@@ -859,6 +859,7 @@ static void complete_journal_encrypt(str
 static bool do_crypt(bool encrypt, struct skcipher_request *req, struct journal_completion *comp)
 {
 	int r;
+retry:
 	skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
 				      complete_journal_encrypt, comp);
 	if (likely(encrypt))
@@ -874,6 +875,10 @@ static bool do_crypt(bool encrypt, struc
 		reinit_completion(&comp->ic->crypto_backoff);
 		return true;
 	}
+	if (r == -ENOMEM) {
+		msleep(1);
+		goto retry;
+	}
 	dm_integrity_io_error(comp->ic, "encrypt", r);
 	return false;
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

