Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DE11421032A
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:54:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-cpNYo8c2PZ2c1eGNRcVJ-g-1; Wed, 01 Jul 2020 00:54:17 -0400
X-MC-Unique: cpNYo8c2PZ2c1eGNRcVJ-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B689BFC5;
	Wed,  1 Jul 2020 04:54:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A42BD7BECA;
	Wed,  1 Jul 2020 04:54:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D35C81809543;
	Wed,  1 Jul 2020 04:54:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614qaOj008738 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:52:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FE79202A97F; Wed,  1 Jul 2020 04:52:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB3CD2029F79
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C59F68007CB
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-433-FvSW1DzNOOSzwEY9xHsOJg-1;
	Wed, 01 Jul 2020 00:52:30 -0400
X-MC-Unique: FvSW1DzNOOSzwEY9xHsOJg-1
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9A1542078A;
	Wed,  1 Jul 2020 04:52:29 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>, linux-crypto@vger.kernel.org
Date: Tue, 30 Jun 2020 21:52:15 -0700
Message-Id: <20200701045217.121126-5-ebiggers@kernel.org>
In-Reply-To: <20200701045217.121126-1-ebiggers@kernel.org>
References: <20200701045217.121126-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614qaOj008738
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 4/6] crypto: algapi - remove
	crypto_check_attr_type()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

Remove crypto_check_attr_type(), since it's no longer used.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/algapi.c         | 15 ---------------
 include/crypto/algapi.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/crypto/algapi.c b/crypto/algapi.c
index 24a56279ca80..58558fae12bd 100644
--- a/crypto/algapi.c
+++ b/crypto/algapi.c
@@ -818,21 +818,6 @@ struct crypto_attr_type *crypto_get_attr_type(struct rtattr **tb)
 }
 EXPORT_SYMBOL_GPL(crypto_get_attr_type);
 
-int crypto_check_attr_type(struct rtattr **tb, u32 type)
-{
-	struct crypto_attr_type *algt;
-
-	algt = crypto_get_attr_type(tb);
-	if (IS_ERR(algt))
-		return PTR_ERR(algt);
-
-	if ((algt->type ^ type) & algt->mask)
-		return -EINVAL;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(crypto_check_attr_type);
-
 const char *crypto_attr_alg_name(struct rtattr *rta)
 {
 	struct crypto_attr_alg *alga;
diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index dce57c89cf98..78902563512b 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -116,7 +116,6 @@ struct crypto_tfm *crypto_spawn_tfm(struct crypto_spawn *spawn, u32 type,
 void *crypto_spawn_tfm2(struct crypto_spawn *spawn);
 
 struct crypto_attr_type *crypto_get_attr_type(struct rtattr **tb);
-int crypto_check_attr_type(struct rtattr **tb, u32 type);
 const char *crypto_attr_alg_name(struct rtattr *rta);
 int crypto_attr_u32(struct rtattr *rta, u32 *num);
 int crypto_inst_setname(struct crypto_instance *inst, const char *name,
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

