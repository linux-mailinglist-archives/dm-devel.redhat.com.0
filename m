Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0149E130F43
	for <lists+dm-devel@lfdr.de>; Mon,  6 Jan 2020 10:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578301965;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=llNMF6neXz54cys7ndGTblHVH48XbhVYRLjUUU7xpeg=;
	b=CS0wcJiV50k9WOeI2vzKA6a8N2kf7NbRVG9VpmaAdNgsI8Fr2AWLWiUIfboa/Lkbv9dRPC
	KkPYr/6Cvp6/PUDtahkqqrJ17wKcHfZ9dTh42EuEnlIqkJPVZB8FOZLe0zaesSTdMiTirF
	9STB+K+gapWnRCW6ES8chjex8/c3u9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-Rl4-RtcTO-Kbjt64aie5tQ-1; Mon, 06 Jan 2020 04:12:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EA87189CD0C;
	Mon,  6 Jan 2020 09:12:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46FFF383;
	Mon,  6 Jan 2020 09:12:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A359181C62;
	Mon,  6 Jan 2020 09:12:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0069C3GH024968 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 04:12:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 17CFF6C35C; Mon,  6 Jan 2020 09:12:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A1B6C345
	for <dm-devel@redhat.com>; Mon,  6 Jan 2020 09:12:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F14F18D7737
	for <dm-devel@redhat.com>; Mon,  6 Jan 2020 09:12:00 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-78-mjHll1W1NLWUfPZv6p3OxA-1; Mon, 06 Jan 2020 04:11:58 -0500
Received: by mail-wm1-f66.google.com with SMTP id 20so14483223wmj.4
	for <dm-devel@redhat.com>; Mon, 06 Jan 2020 01:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JM1VzsIoBWrlvP2NSpmP8Omm91/74PDolu8QUxa7RBY=;
	b=Oivd9OcmN3LfnXLNFBIDh0bcOEPbo/j41etfZsqbfThQgrZwfBkqFq+NnD1y2m1FrE
	XqkWXCt6mE+jhXZ/u+5Y+FxLDRCx5a2jrDyDNrvTtmSN3KqA8JMNkIYudrZ6prRovKG7
	Xq5ZiKZN4hc9G+u1HqKlMpC5KArAuNMOTc5Bqjtrq4ywH8dv4cefHqry6DDwsM0lBjDD
	6TgYshhxIkO0MHk0FMEdiVYwtNNhDFldZxG0SN4GN5CkQxD4rzOPIN0yFOrdO8vwg45U
	iDOgw35EJmw1yDZQQPEuUBtdLYirxz0ClrKDtiasVY7ROg9mb4jKubAv3iUzOXmAS0Bf
	vKWw==
X-Gm-Message-State: APjAAAXFtBE6BdHSX5vMnZZnj3sL92hBMH/+ygRe7LjjCLw3nyYF8Q9s
	i4HCq9/HTElrdX1omp4CDsgph8Ue
X-Google-Smtp-Source: APXvYqw3A8GGKWLMALEJJehnapKa5swreJ+fkS5eACW8yvmxGfiCdW8Bpfd9U8fVifLNTEUEYy3R4g==
X-Received: by 2002:a05:600c:2c50:: with SMTP id
	r16mr32074397wmg.74.1578301917037; 
	Mon, 06 Jan 2020 01:11:57 -0800 (PST)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	a14sm76348433wrx.81.2020.01.06.01.11.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 01:11:56 -0800 (PST)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Mon,  6 Jan 2020 10:11:47 +0100
Message-Id: <20200106091147.1485292-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-MC-Unique: mjHll1W1NLWUfPZv6p3OxA-1
X-MC-Unique: Rl4-RtcTO-Kbjt64aie5tQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0069C3GH024968
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>, stable@vger.kernel.org
Subject: [dm-devel] [PATCH] dm-crypt: Fix benbi IV constructor if used in
	authenticated mode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If benbi IV is used in AEAD constructionm for example
  cryptsetup luksFormat <device> --cipher twofish-xts-benbi --key-size 512 --integrity=hmac-sha256
the constructor ues wrong skcipher function and crashes.

 BUG: kernel NULL pointer dereference, address: 00000014
 ...
 EIP: crypt_iv_benbi_ctr+0x15/0x70 [dm_crypt]
 Call Trace:
  ? crypt_subkey_size+0x20/0x20 [dm_crypt]
  crypt_ctr+0x567/0xfc0 [dm_crypt]
  dm_table_add_target+0x15f/0x340 [dm_mod]

This patch fixes the problem with properly using crypt_aead_blocksize() in this case.

Reported in https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=941051

Signed-off-by: Milan Broz <gmazyland@gmail.com>
Cc: <stable@vger.kernel.org> # v4.12+
---
 drivers/md/dm-crypt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index f9370a1a574b..fd30143dca91 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -343,8 +343,14 @@ static int crypt_iv_essiv_gen(struct crypt_config *cc, u8 *iv,
 static int crypt_iv_benbi_ctr(struct crypt_config *cc, struct dm_target *ti,
 			      const char *opts)
 {
-	unsigned bs = crypto_skcipher_blocksize(any_tfm(cc));
-	int log = ilog2(bs);
+	unsigned bs;
+	int log;
+
+	if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags))
+		bs = crypto_aead_blocksize(any_tfm_aead(cc));
+	else
+		bs = crypto_skcipher_blocksize(any_tfm(cc));
+	log = ilog2(bs);
 
 	/* we need to calculate how far we must shift the sector count
 	 * to get the cipher block count, we use this shift in _gen */
-- 
2.25.0.rc1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

