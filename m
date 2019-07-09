Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 132BF636DF
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 15:25:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC3413179178;
	Tue,  9 Jul 2019 13:25:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09CE6848DA;
	Tue,  9 Jul 2019 13:25:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F8251833003;
	Tue,  9 Jul 2019 13:24:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69DMjd2006675 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 09:22:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15B88466A1; Tue,  9 Jul 2019 13:22:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F766466A0
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:22:42 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A7E530860D5
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:22:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so10874737wrr.5
	for <dm-devel@redhat.com>; Tue, 09 Jul 2019 06:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8TRl49LlHwPh+S3aZZuJGzkPdb+qKd5xTmuRDh0+uR0=;
	b=W9PkRtER5pP8ac/mVLQ20HM6rsWJC9ArXTh2tBZOFZeJW/Hq0SCKa16KkVy8U6RZrZ
	PbTbP9g8yOcQNrJ3FH2R218d/riMgn6G+tvKbJBzD4i3V3xhK1uroF3FuBl0mJDnOqxn
	H+gticHF7nRV7nOvReWbR815iLpJQJUAlyUhghJqQrbp/jNhU5ngiIEsWm9wEM57Ex2T
	Q+Z6he0YayNdEuRdx2YEsX60+r8ngmEFtuafJQN+ku7pE1rPDyA7Z25BuSGApxxaEvn4
	WiMiw1+4HRy4im+Es0/n+QeD9gU+83R8xaKowElVEwL6nyS7PsuKUkmwQMKmsxh4rPnu
	TNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8TRl49LlHwPh+S3aZZuJGzkPdb+qKd5xTmuRDh0+uR0=;
	b=ijLutkE6tD3W8GULwGDODNlU4rM6EItZJIpITSHBMy7Df+Ux7PxR31kVRgOOM6ZM42
	VC/rkBmFuU3zSwMeHY7uMIWlRyllc3FYZGJCK9JuunwItY7SqBxDntp1yvJ+3WPhZHSv
	CC5DudwUI6IYIGtsXOOYa4n0BMAMTTF6UsGevFyMT3nQA6g//aLRc5VkqfeLBuxT6f22
	ox2nkLpr8Vl2S1eL0en1wFPd7hsvcMcXMPug2YR6Xs9ncRT82JNDemsiwhqYZIIz7gc5
	mwrbqzfriGUoTa/5QWLYFQMjD+4qWJDjyeZfp6hZDH7/BSGagoxiwpRqGfBVNeWHFEr8
	MecQ==
X-Gm-Message-State: APjAAAUPl/9/5aCmJAWYYLiu/2scYC3nkwD/BvdLBIP9HjrCR6LhXmlD
	u+FEIa4ZOl8TioBU+7huJ5kAb3J+530=
X-Google-Smtp-Source: APXvYqxnjyYac9ehjS+wuAvfSLVp34FMFBsJ9Tt8k3GpFKJKoSSw4KIFqCoJf/95RR22fy/7SdW0vw==
X-Received: by 2002:a5d:5012:: with SMTP id e18mr14933112wrt.166.1562678547636;
	Tue, 09 Jul 2019 06:22:27 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	z25sm3533319wmf.38.2019.07.09.06.22.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 06:22:26 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Tue,  9 Jul 2019 15:22:13 +0200
Message-Id: <20190709132214.3905-2-gmazyland@gmail.com>
In-Reply-To: <20190709132214.3905-1-gmazyland@gmail.com>
References: <20190709132214.3905-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 09 Jul 2019 13:22:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 09 Jul 2019 13:22:34 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.228 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, PDS_NO_HELO_DNS, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v2 2/3] dm-crypt: Remove obsolete comment about
	plumb IV.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 09 Jul 2019 13:25:25 +0000 (UTC)

The URL is no longer valid and the comment is obsolete anyway
(the plumb IV was never used).

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 0e24079e97da..c567e13a0e5f 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -290,9 +290,6 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
  *       is calculated from initial key, sector number and mixed using CRC32.
  *       Note that this encryption scheme is vulnerable to watermarking attacks
  *       and should be used for old compatible containers access only.
- *
- * plumb: unimplemented, see:
- * http://article.gmane.org/gmane.linux.kernel.device-mapper.dm-crypt/454
  */
 
 static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
