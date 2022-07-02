Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B6568BF2
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jul 2022 16:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657119387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wtbAl3SBwauEwVUhE9sdbyiOATRSJWjonRjB8uaKCSc=;
	b=Sl+t8dfM9QNiE7wYHfGjKDM0ldnbaQRBhDxOh6zw1/4hL3bjuhRmZGh23rjPX+tuKDWPyb
	skuZccRlJ733AY2qsWvlKSpVUbZvHfRwaFIh8I65R1Yqn9NgQ8CXmN7AjZtG+AXyk5EMmp
	ldlEeuK67GgyLIuNQA0kOxttV54whrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-YnILA0acMbmnWfPgQB-lSw-1; Wed, 06 Jul 2022 10:56:20 -0400
X-MC-Unique: YnILA0acMbmnWfPgQB-lSw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DDA09693C5;
	Wed,  6 Jul 2022 14:56:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12604492C3B;
	Wed,  6 Jul 2022 14:56:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F624194707F;
	Wed,  6 Jul 2022 14:56:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D770A1947042
 for <dm-devel@listman.corp.redhat.com>; Sat,  2 Jul 2022 18:37:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B5C17492CA3; Sat,  2 Jul 2022 18:37:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1757492C3B
 for <dm-devel@redhat.com>; Sat,  2 Jul 2022 18:37:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A9C7101A586
 for <dm-devel@redhat.com>; Sat,  2 Jul 2022 18:37:20 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 us-mta-390-CUkBRdWOPSC09AZrcHNZ8w-1; Sat, 02 Jul 2022 14:37:19 -0400
X-MC-Unique: CUkBRdWOPSC09AZrcHNZ8w-1
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 7hsIoTjZy4Ltq7hsIonixx; Sat, 02 Jul 2022 20:29:46 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 02 Jul 2022 20:29:46 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
 vneethv@linux.ibm.com, oberpar@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, almaz.alexandrovich@paragon-software.com,
 yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk
Date: Sat,  2 Jul 2022 20:29:44 +0200
Message-Id: <a1d240070b58addae91aef9912925835ff09122d.1656785856.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Wed, 06 Jul 2022 14:51:05 +0000
Subject: [dm-devel] [PATCH 4/4] bitmap: Use bitmap_size()
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
Cc: linux-s390@vger.kernel.org, ntfs3@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplify code and take advantage of the new bitmap_size() function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/bitmap.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index f66fb98a4126..668b47c1e5de 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -243,21 +243,18 @@ extern int bitmap_print_list_to_buf(char *buf, const unsigned long *maskp,
 
 static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
 {
-	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-	memset(dst, 0, len);
+	memset(dst, 0, bitmap_size(nbits));
 }
 
 static inline void bitmap_fill(unsigned long *dst, unsigned int nbits)
 {
-	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-	memset(dst, 0xff, len);
+	memset(dst, 0xff, bitmap_size(nbits));
 }
 
 static inline void bitmap_copy(unsigned long *dst, const unsigned long *src,
 			unsigned int nbits)
 {
-	unsigned int len = BITS_TO_LONGS(nbits) * sizeof(unsigned long);
-	memcpy(dst, src, len);
+	memcpy(dst, src, bitmap_size(nbits));
 }
 
 /*
-- 
2.34.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

