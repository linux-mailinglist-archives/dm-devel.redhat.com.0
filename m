Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF321F67F
	for <lists+dm-devel@lfdr.de>; Wed, 15 May 2019 16:26:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2FB4149A2;
	Wed, 15 May 2019 14:26:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19CCB1001E98;
	Wed, 15 May 2019 14:26:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4C714BB41;
	Wed, 15 May 2019 14:25:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FENwxm031689 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 10:23:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D92525D9D0; Wed, 15 May 2019 14:23:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D422A5D9C3
	for <dm-devel@redhat.com>; Wed, 15 May 2019 14:23:56 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA08F149A2
	for <dm-devel@redhat.com>; Wed, 15 May 2019 14:23:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x64so225359wmb.5
	for <dm-devel@redhat.com>; Wed, 15 May 2019 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PPSv5QXz/0gm0VMjwMbO1+FpQXQ/lI/x4fCz9S2kv+U=;
	b=i1dXCJ/hdl+lCzlQfG7q13Qv2OyTJgWYyJhqx0rY98eJKtdPX42OilBY17Hu06dbVk
	XBSyUAI5Y+KiIFMz8XVcNQnkGBGjjMSEQOowAuLqy3S1Y9iGvukGuGj1FB2ppT+5REwl
	M7Zcb2Ss75mmmjRKt4J+2hWCN6B76K+lRFavt2KK5+6As7xGdErFyixIuJPHAi/9CIMP
	RdMdh+sImSrZIaXlxTw+lYGk/WxZthmS+MGKbcWN3c0F+OEOAPveMyw/Aefwfv5dlTz5
	RYZUUJ6V5Xg6sCFpUaSYHUeLqnMuJ6OA4R6/Uapg9ixt4WWGpc+B3fn65iCbYaLM3MPP
	39kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PPSv5QXz/0gm0VMjwMbO1+FpQXQ/lI/x4fCz9S2kv+U=;
	b=rXVg/9N52iL9GwvI8Kvug2Jy7Zj6hQLygddkav/UM1Wz0PN2gwanSkXEPPK6TyQnmQ
	JTf6+5ZDjxl2Z/OKuNC8UYONbrh3blf6hD+/9wIYU4iZgteqbce1BfrdvMstoI/Qn0bz
	pZBWMplr5pVOc8/8FKOBi6g7uiu02CXgiEmEdZNpL4y09qciqGH5WIqFCbIV9gPDzhVO
	qn5v/lNunIZagZcV1voIHHEZZrccqQ6S4qUihY/7NAHx91eLqBhZuNG3QLyR6Kx6k3I8
	D3uV4Kt/iZc3J52luB5RUsgcnUk3CNAY3oZYTaZAEcoKvIKUGKzNw/FBBTuoYquzzrqA
	za7g==
X-Gm-Message-State: APjAAAVqBEllgoLbmQGvBcHGXJdHdxpnNl3gWYCegR70KXf1Hkq0y/HR
	nQDX3xG1nyFPCe0xi4U5MztfxJXe
X-Google-Smtp-Source: APXvYqwqxWKVU90FezQSCNkpzHGwPDvhMhMVL9es8c8W6uAQY294BoxHsPFNLWeiAX73vffPTb2zaQ==
X-Received: by 2002:a1c:720b:: with SMTP id n11mr22652774wmc.81.1557930231353; 
	Wed, 15 May 2019 07:23:51 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	v184sm3015093wma.6.2019.05.15.07.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 07:23:50 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Wed, 15 May 2019 16:23:43 +0200
Message-Id: <20190515142343.30641-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 15 May 2019 14:23:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Wed, 15 May 2019 14:23:53 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH 2/2] dm-crypt: move detailed message into debug
	level.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 15 May 2019 14:26:19 +0000 (UTC)

The information about tag size should not be printed
without debug info set. Also pront device major:minor in
the error message to identify the device instance.

Also use rate limiting and debug level for info about
used crypto API implementaton.
(During online reencryption this message saturates syslog,
because we are moving hotzone across the whole device.)

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 36dfa36505ed..af017d044dc0 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -946,6 +946,7 @@ static int crypt_integrity_ctr(struct crypt_config *cc, struct dm_target *ti)
 {
 #ifdef CONFIG_BLK_DEV_INTEGRITY
 	struct blk_integrity *bi = blk_get_integrity(cc->dev->bdev->bd_disk);
+	struct mapped_device *md = dm_table_get_md(ti->table);
 
 	/* From now we require underlying device with our integrity profile */
 	if (!bi || strcasecmp(bi->profile->name, "DM-DIF-EXT-TAG")) {
@@ -965,7 +966,7 @@ static int crypt_integrity_ctr(struct crypt_config *cc, struct dm_target *ti)
 
 	if (crypt_integrity_aead(cc)) {
 		cc->integrity_tag_size = cc->on_disk_tag_size - cc->integrity_iv_size;
-		DMINFO("Integrity AEAD, tag size %u, IV size %u.",
+		DMDEBUG("%s: Integrity AEAD, tag size %u, IV size %u.", dm_device_name(md),
 		       cc->integrity_tag_size, cc->integrity_iv_size);
 
 		if (crypto_aead_setauthsize(any_tfm_aead(cc), cc->integrity_tag_size)) {
@@ -973,7 +974,7 @@ static int crypt_integrity_ctr(struct crypt_config *cc, struct dm_target *ti)
 			return -EINVAL;
 		}
 	} else if (cc->integrity_iv_size)
-		DMINFO("Additional per-sector space %u bytes for IV.",
+		DMDEBUG("%s: Additional per-sector space %u bytes for IV.", dm_device_name(md),
 		       cc->integrity_iv_size);
 
 	if ((cc->integrity_tag_size + cc->integrity_iv_size) != bi->tag_size) {
@@ -1890,7 +1891,7 @@ static int crypt_alloc_tfms_skcipher(struct crypt_config *cc, char *ciphermode)
 	 * algorithm implementation is used.  Help people debug performance
 	 * problems by logging the ->cra_driver_name.
 	 */
-	DMINFO("%s using implementation \"%s\"", ciphermode,
+	DMDEBUG_LIMIT("%s using implementation \"%s\"", ciphermode,
 	       crypto_skcipher_alg(any_tfm(cc))->base.cra_driver_name);
 	return 0;
 }
@@ -1910,7 +1911,7 @@ static int crypt_alloc_tfms_aead(struct crypt_config *cc, char *ciphermode)
 		return err;
 	}
 
-	DMINFO("%s using implementation \"%s\"", ciphermode,
+	DMDEBUG_LIMIT("%s using implementation \"%s\"", ciphermode,
 	       crypto_aead_alg(any_tfm_aead(cc))->base.cra_driver_name);
 	return 0;
 }
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
