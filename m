Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C965F8F6
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 15:15:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39196307D920;
	Thu,  4 Jul 2019 13:15:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98C4784276;
	Thu,  4 Jul 2019 13:15:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE58F41F53;
	Thu,  4 Jul 2019 13:14:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64DCLBP028673 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 09:12:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFE9018B93; Thu,  4 Jul 2019 13:12:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D95DD968C4
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:12:19 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BF1C3082E51
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 13:12:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f9so6570902wre.12
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eUtaMzTNP5KxTFEx4foexwTrUTVbqa8AryQmg0468gg=;
	b=pRxfZU0yv0Nij9aKgoZrg1B9m0o7vBolDGzL1ArroTSL5CLo+FMGQkR5sgliwArU3k
	th3jtvASN5P12/NIyayPm1R9iTILouqyJdaos3KgfomuEA8ZO4yr/MDxnq/KleD3b3oY
	sAoTsvxzZpz1JHn4bDVZ4rzEq61M/QA4eCvWTrWgtbU4YILiDydSFKbr9hOYyk/eVpfH
	L0jplq5CGG7H4OZrBOaLJjZ09NDpnprDN9h7yi4mRLV9Qtn9uevyYqllymmXI3RsaEaa
	ArMdgdcFCVPTx4Tlqh20haAtuogn9TO1BUkE51U6EiKwNGaUJJjOsIZ+KVmOD1XPX/sE
	U/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eUtaMzTNP5KxTFEx4foexwTrUTVbqa8AryQmg0468gg=;
	b=dIPznUGpF+1j/aYp9JJoCOatMBI3u51rHVGR5TfA8kVTDvyrwq30kp2QBr+QeKomzL
	8YDW7U482tjpjuQUrtvyuCTLp57Ohnxi1NdKtiVuu34NnZdbVa2WdIaS3yaNACzu8Ojt
	zd5ID1ZbzpU6UU6ljhmYk2D6UdtXkPbb8OC/0a2qNBRjY9LehH+9KvO20UIR2exrX7N9
	WTVpunlXp9eE+ZtWW1yTgennuNcDaWOty2Ei8G7hamYfLaWJEP8+5Q3+fctycFHZOUJY
	9fhK1JmXG2V4pdcvjUQWe65w01fFB0ZP2D0BgicfUUwzpdHkTfuqIYJCWcFygEEua9Y2
	ingg==
X-Gm-Message-State: APjAAAUoFm9QzQ10tRzW0STTGuNpuCZ9ULqp5q3Qv5/V/LDRL5GEAcxa
	utzvNRzww3r85sQ65rVAvMN46oI+8Mw=
X-Google-Smtp-Source: APXvYqyipRxgHHyCm89WuC/nzl7vvHceHJpkePxPJ2+KJMpLzQpW7MG8/6Fpozc4zWf2/IFLV75btA==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr36011015wrn.142.1562245921756; 
	Thu, 04 Jul 2019 06:12:01 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	u6sm1844555wrw.15.2019.07.04.06.12.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 06:12:01 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Thu,  4 Jul 2019 15:10:31 +0200
Message-Id: <20190704131033.9919-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 04 Jul 2019 13:12:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 04 Jul 2019 13:12:03 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.089  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 04 Jul 2019 09:14:39 -0400
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH 1/3] dm-crypt: Wipe private IV struct after key
	invalid flag is set.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 04 Jul 2019 13:15:13 +0000 (UTC)

If a private IV wipe function fails, the code does not set the key
invalid flag. This patch moves code after the flag is set and
prevents the device resume in an inconsistent state.

Also, it allows using of a randomized key in private wipe function
(to be used later patches).

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 1b16d34bb785..c6d41a7e89c9 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2158,6 +2158,14 @@ static int crypt_wipe_key(struct crypt_config *cc)
 
 	clear_bit(DM_CRYPT_KEY_VALID, &cc->flags);
 	get_random_bytes(&cc->key, cc->key_size);
+
+	/* Wipe IV private keys */
+	if (cc->iv_gen_ops && cc->iv_gen_ops->wipe) {
+		r = cc->iv_gen_ops->wipe(cc);
+		if (r)
+			return r;
+	}
+
 	kzfree(cc->key_string);
 	cc->key_string = NULL;
 	r = crypt_setkey(cc);
@@ -3050,14 +3058,8 @@ static int crypt_message(struct dm_target *ti, unsigned argc, char **argv,
 				memset(cc->key, 0, cc->key_size * sizeof(u8));
 			return ret;
 		}
-		if (argc == 2 && !strcasecmp(argv[1], "wipe")) {
-			if (cc->iv_gen_ops && cc->iv_gen_ops->wipe) {
-				ret = cc->iv_gen_ops->wipe(cc);
-				if (ret)
-					return ret;
-			}
+		if (argc == 2 && !strcasecmp(argv[1], "wipe"))
 			return crypt_wipe_key(cc);
-		}
 	}
 
 error:
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
