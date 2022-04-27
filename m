Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30160511BEB
	for <lists+dm-devel@lfdr.de>; Wed, 27 Apr 2022 17:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651073687;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S2+oGzs9c/5agq//9S3z3hyxHSGP4jGM+1Soif17ubM=;
	b=VuqxIzcqImWtuB2WeadHTb0TWTaocFXdwsoa5uuYI/hK0iCT1j05nXvy12wjGQ/+G8xFEl
	hB3PcygovINyz/qcaIc0xmwX+6Yf5Ks1YLq55VYouZaJJchtjUUviq6mmF8frYPWJVshCd
	9L4aWgdMxb2tBHccgYGpV2IHf0aeUXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-TZvb-U3dMj6CRxGuaSXUcQ-1; Wed, 27 Apr 2022 11:34:45 -0400
X-MC-Unique: TZvb-U3dMj6CRxGuaSXUcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CEBF811E78;
	Wed, 27 Apr 2022 15:34:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 843A5C33B13;
	Wed, 27 Apr 2022 15:34:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6315D194704C;
	Wed, 27 Apr 2022 15:34:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 369B91947041
 for <dm-devel@listman.corp.redhat.com>; Wed, 27 Apr 2022 15:26:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0546B463EF6; Wed, 27 Apr 2022 15:26:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF52401475;
 Wed, 27 Apr 2022 15:26:40 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 23RFQeCt021649; Wed, 27 Apr 2022 11:26:40 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 23RFQehO021645; Wed, 27 Apr 2022 11:26:40 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 27 Apr 2022 11:26:40 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHp75Vf=sEeoHwzb2RdVFsmZ_mWAyg2zdMKgtW9RQFM_bTMHPw@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2204271112080.20348@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2204241643030.17244@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHp75VdHnvv6FH1BKcs8WgGF3nJpj77TsrmsQGBSpsAQU_S-bw@mail.gmail.com>
 <alpine.LRH.2.02.2204260759540.2737@file01.intranet.prod.int.rdu2.redhat.com>
 <YmfxaB1j65p8dOyj@smile.fi.intel.com>
 <alpine.LRH.2.02.2204261128220.5129@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHp75Vc8kb+dpT_i93No+0_==tLuYKxu9t1Nnv1KRomRc+Ke1w@mail.gmail.com>
 <alpine.LRH.2.02.2204271000020.1114@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHp75Vf=sEeoHwzb2RdVFsmZ_mWAyg2zdMKgtW9RQFM_bTMHPw@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH v3] hex2bin: fix access beyond string end
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
Cc: Mike Snitzer <msnitzer@redhat.com>,
 device-mapper development <dm-devel@redhat.com>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Milan Broz <gmazyland@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we pass too short string to "hex2bin" (and the string size without the
terminating NUL character is even), "hex2bin" reads one byte after the
terminating NUL character. This patch fixes it.

Note that hex_to_bin returns -1 on error and hex2bin return -EINVAL on
error - so we can't just return the variable "hi" or "lo" on error. This
inconsistency may be fixed in the next merge window, but for the purpose
of fixing this bug, we just preserve the existing behavior and return -1
and -EINVAL.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Fixes: b78049831ffe ("lib: add error checking to hex2bin")
Cc: stable@vger.kernel.org

---
 lib/hexdump.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

Index: linux-2.6/lib/hexdump.c
===================================================================
--- linux-2.6.orig/lib/hexdump.c	2022-04-24 18:51:16.000000000 +0200
+++ linux-2.6/lib/hexdump.c	2022-04-27 17:16:38.000000000 +0200
@@ -45,10 +45,13 @@ EXPORT_SYMBOL(hex_to_bin);
 int hex2bin(u8 *dst, const char *src, size_t count)
 {
 	while (count--) {
-		int hi = hex_to_bin(*src++);
-		int lo = hex_to_bin(*src++);
+		int hi, lo;
 
-		if ((hi < 0) || (lo < 0))
+		hi = hex_to_bin(*src++);
+		if (unlikely(hi < 0))
+			return -EINVAL;
+		lo = hex_to_bin(*src++);
+		if (unlikely(lo < 0))
 			return -EINVAL;
 
 		*dst++ = (hi << 4) | lo;
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

