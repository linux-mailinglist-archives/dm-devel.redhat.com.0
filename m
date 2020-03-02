Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7891766C8
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 23:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583187685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E3zGleVe53SKD8Le+yhkvQHiXAdtaSrTuWeP40Q1qd0=;
	b=IhKnrCQio1BeubEJcFYFIy6CtsQT9bpyZd22SpmeFxsnjvoVGzUBdjP8ro0Re8pbzKznlO
	PSH62/mHPXLFyZV5vkXJqZC8IIrtRLqKhXuTXjQU8AaeB5a/6rUJmsJ/LrHBqA4FrHon2d
	wy2kWMVKA65oeHvbe7+MAXNMZDV3kmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-8vpmQdtSNmCRSvPLaq_s3w-1; Mon, 02 Mar 2020 17:21:23 -0500
X-MC-Unique: 8vpmQdtSNmCRSvPLaq_s3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6BCB18C8C0C;
	Mon,  2 Mar 2020 22:21:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 525675C1C3;
	Mon,  2 Mar 2020 22:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBDE7860D7;
	Mon,  2 Mar 2020 22:21:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022MKxii003569 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 17:20:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0F7932026D67; Mon,  2 Mar 2020 22:20:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 099342026D68
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D71D8007AC
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-34-bfyJ30xDMeeRHLU_K_2HsA-1;
	Mon, 02 Mar 2020 17:20:55 -0500
X-MC-Unique: bfyJ30xDMeeRHLU_K_2HsA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 50F47B336;
	Mon,  2 Mar 2020 22:20:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon,  2 Mar 2020 23:20:22 +0100
Message-Id: <20200302222025.21022-2-mwilck@suse.com>
In-Reply-To: <20200302222025.21022-1-mwilck@suse.com>
References: <20200302222025.21022-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022MKxii003569
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/4] Remove tests/directio_test_dev
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This file is designed to be customized and will therefore differ from
the committed version in every serious development environment. I find
that inconvenient, as the file needs to be stashed away before every
serious git activity, and could easily be committed by mistake.

Follow-up patches will enable various alternative ways to set the
DIO_TEST_DEV during build.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/directio_test_dev | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 tests/directio_test_dev

diff --git a/tests/directio_test_dev b/tests/directio_test_dev
deleted file mode 100644
index d64e6238..00000000
--- a/tests/directio_test_dev
+++ /dev/null
@@ -1,4 +0,0 @@
-# To run the directio tests on an actual block device, uncomment the line
-# starting with DIO_TES_DEV, and set it to the appropriate device
-
-# DIO_TEST_DEV=/dev/sdb
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

