Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D910E2D0DA1
	for <lists+dm-devel@lfdr.de>; Mon,  7 Dec 2020 11:00:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-GKEGlw7COMSHd1aR5Q5Pow-1; Mon, 07 Dec 2020 05:00:15 -0500
X-MC-Unique: GKEGlw7COMSHd1aR5Q5Pow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E3C8803637;
	Mon,  7 Dec 2020 09:59:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0D005D9DE;
	Mon,  7 Dec 2020 09:59:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B0674E58F;
	Mon,  7 Dec 2020 09:59:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4HCBua014077 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 12:12:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 11C792166B30; Fri,  4 Dec 2020 17:12:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C31A2166B2B
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 17:12:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8533880018D
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 17:12:08 +0000 (UTC)
Received: from latitanza.investici.org (latitanza.investici.org
	[82.94.249.234]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-587-G72_m9WkPgi1xktvvP8a0A-1; Fri, 04 Dec 2020 12:12:06 -0500
X-MC-Unique: G72_m9WkPgi1xktvvP8a0A-1
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4CnfFM5VFHz8shq;
	Fri,  4 Dec 2020 17:04:23 +0000 (UTC)
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
	(Authenticated sender: laniel_francis@privacyrequired.com) by
	localhost (Postfix) with ESMTPSA id 4CnfFM0n5Sz8sfb; 
	Fri,  4 Dec 2020 17:04:22 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com
Date: Fri,  4 Dec 2020 18:03:10 +0100
Message-Id: <20201204170319.20383-5-laniel_francis@privacyrequired.com>
In-Reply-To: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
References: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B4HCBua014077
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 07 Dec 2020 04:59:37 -0500
Cc: Francis Laniel <laniel_francis@privacyrequired.com>,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [RFC PATCH v1 04/12] device-mapper: Replace strstarts()
	by str_has_prefix().
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Francis Laniel <laniel_francis@privacyrequired.com>

The two functions indicates if a string begins with a given prefix.
The only difference is that strstarts() returns a bool while str_has_prefix()
returns the length of the prefix if the string begins with it or 0 otherwise.

Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>
---
 drivers/md/dm-crypt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 392337f16ecf..b6f31b662d93 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2659,7 +2659,7 @@ static int crypt_ctr_auth_cipher(struct crypt_config *cc, char *cipher_api)
 	char *start, *end, *mac_alg = NULL;
 	struct crypto_ahash *mac;
 
-	if (!strstarts(cipher_api, "authenc("))
+	if (!str_has_prefix(cipher_api, "authenc("))
 		return 0;
 
 	start = strchr(cipher_api, '(');
@@ -2858,7 +2858,7 @@ static int crypt_ctr_cipher(struct dm_target *ti, char *cipher_in, char *key)
 		return -ENOMEM;
 	}
 
-	if (strstarts(cipher_in, "capi:"))
+	if (str_has_prefix(cipher_in, "capi:"))
 		ret = crypt_ctr_cipher_new(ti, cipher_in, key, &ivmode, &ivopts);
 	else
 		ret = crypt_ctr_cipher_old(ti, cipher_in, key, &ivmode, &ivopts);
-- 
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

