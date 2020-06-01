Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF5B1EA78D
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 18:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591027734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BqlFFWMrpb1q8QUlXU5106lNKk7MAiSrHVR00gZsfcU=;
	b=XcZzsuBPul785mY6KwZqkS6etE8OQMiVbhaAWU4c+E9wXNqunrXZmNBgCKRDmF/xT6tKJf
	Aj+yEUCGlBHIR7ZTdhysaYwQYfEnTSu58CR6eQ+nmDxPJ5Vyr68w8gzk/TBvfKiCapPn8Q
	V5/d0lbJuc30IHapcTy9ymHHdeOC16U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-c8tKreLbNxW5S5XzM4gAoQ-1; Mon, 01 Jun 2020 12:08:51 -0400
X-MC-Unique: c8tKreLbNxW5S5XzM4gAoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A515806E2C;
	Mon,  1 Jun 2020 16:08:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05C935D9C9;
	Mon,  1 Jun 2020 16:08:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7AF41809547;
	Mon,  1 Jun 2020 16:08:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051G4P1i032223 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 12:04:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E29F47F0A2; Mon,  1 Jun 2020 16:04:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.194.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 347687E7F1;
	Mon,  1 Jun 2020 16:04:25 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jfmvG-0001W2-Ob; Mon, 01 Jun 2020 18:04:23 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 01 Jun 2020 18:04:22 +0200
Message-Id: <20200601160421.912555280@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 01 Jun 2020 18:03:36 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>, 
	djeffery@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: guazhang@redhat.com, qat-linux@intel.com, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-crypto@vger.kernel.org, jpittman@redhat.com
Subject: [dm-devel] [PATCH 4/4] dm-crypt: sleep and retry on allocation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=crypt-enomem.patch

Some hardware crypto drivers use GFP_ATOMIC allocations in the request
routine. These allocations can randomly fail - for example, they fail if
too many network packets are received.

If we propagated the failure up to the I/O stack, it would cause I/O
errors and data corruption. So, we sleep and retry.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

Index: linux-2.6/drivers/md/dm-crypt.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-crypt.c
+++ linux-2.6/drivers/md/dm-crypt.c
@@ -1534,6 +1534,7 @@ static blk_status_t crypt_convert(struct
 		crypt_alloc_req(cc, ctx);
 		atomic_inc(&ctx->cc_pending);
 
+again:
 		if (crypt_integrity_aead(cc))
 			r = crypt_convert_block_aead(cc, ctx, ctx->r.req_aead, tag_offset);
 		else
@@ -1541,6 +1542,17 @@ static blk_status_t crypt_convert(struct
 
 		switch (r) {
 		/*
+		 * Some hardware crypto drivers use GFP_ATOMIC allocations in
+		 * the request routine. These allocations can randomly fail. If
+		 * we propagated the failure up to the I/O stack, it would cause
+		 * I/O errors and data corruption.
+		 *
+		 * So, we sleep and retry.
+		 */
+		case -ENOMEM:
+			msleep(1);
+			goto again;
+		/*
 		 * The request was queued by a crypto driver
 		 * but the driver request queue is full, let's wait.
 		 */

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

