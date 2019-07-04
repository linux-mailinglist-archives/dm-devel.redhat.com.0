Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53D5F8F4
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 15:15:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A00830C0DD5;
	Thu,  4 Jul 2019 13:14:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B671001DC3;
	Thu,  4 Jul 2019 13:14:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AED118433A1;
	Thu,  4 Jul 2019 13:13:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64DCN7C028707 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 09:12:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FD2B5D71B; Thu,  4 Jul 2019 13:12:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B21D17C21
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:12:20 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 243F02F8BC4
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:12:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a10so5497808wrp.9
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BX9lj6z8e1utzuyj8zOVNBuApmTW0qRrpYki7ieh5MQ=;
	b=NLCeOuy160Po9a+89z5EDwH7VKiOrmsDFWDXRaQ6f8kqFzSo5APvIto2MnUO8NugHs
	Ix+NC8BqKiRI8IlXl3JEQZXWSzWvbjQ6TRC4BCLSxmijCWdXX3Jyb8tNowL6/LMfpWTG
	SQjw9Enc4nm0wvjPh8AepZaToRWUAvD7IoNrrto296w7DXvySjqnKiEq7jey3lpMIgSz
	mCr/etjoIoRCqfiP3hwNNZUHsZKEnn2MARfNR5TA2GDbqYZii46oc62DXVZ87iOi6jJn
	ZuD8U0fSUDN5Nbad/sYVfltEcV4K03uGIfsTs9eKH/6EyQBnPlvToh2XlfGYnDf/dQfq
	dSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BX9lj6z8e1utzuyj8zOVNBuApmTW0qRrpYki7ieh5MQ=;
	b=R+vom/Mx4Hl+lPJFAi8LS3tuCe8LTcR2ufblFXsT0jCRbynUw/3CAMwRAq0UbG8KLf
	DnpEPmy/SZK6Q6GwO3A+k2xRjj3WWgfr9pGxtiTV7nPZQJY+dCSP5+nBK7RKqI5FSxT6
	6EbqbfuAETioxXXmIdouAWsgk5Xfmo/twKrE9etGEvzvIzyh3I3AUvTVUnAxcGk8osu/
	a1/5zwBZIe6kR0nyZZYe5hCw0AJiMZRRQhu0TnDf+ZKKfGdKJRB8zOL4UfbSlX/ke+aK
	xFbplFbVKRM6oz9lYeuhdw2xUGIrhHFsg9Ln8yjfR1offZqddGsvIEuM3STe3I6mdxy5
	AKdQ==
X-Gm-Message-State: APjAAAX73UiMzjEX8aWiULonEAkvxdagHPQcCyHfyeAtVzhjAfHi4t05
	zcv1CfVd1zuqPHmF95+69Mmv9DYZwt0=
X-Google-Smtp-Source: APXvYqxIo6C+noW8VqzS+ZpUPQ9gb5roIUOIdFVJl3XJdNMVIzHBhmCF2XvsB3nyrlcslffSZy5MgQ==
X-Received: by 2002:adf:e3cc:: with SMTP id k12mr16168303wrm.284.1562245922551;
	Thu, 04 Jul 2019 06:12:02 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	u6sm1844555wrw.15.2019.07.04.06.12.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 06:12:01 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Thu,  4 Jul 2019 15:10:32 +0200
Message-Id: <20190704131033.9919-2-gmazyland@gmail.com>
In-Reply-To: <20190704131033.9919-1-gmazyland@gmail.com>
References: <20190704131033.9919-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 04 Jul 2019 13:12:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 04 Jul 2019 13:12:04 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.089  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH 2/3] dm-crypt: Remove obsolete comment about
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 04 Jul 2019 13:15:07 +0000 (UTC)

The URL is no longer valid and the comment is obsolete anyway
(the plumb IV was never used).

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index c6d41a7e89c9..96ead4492787 100644
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
