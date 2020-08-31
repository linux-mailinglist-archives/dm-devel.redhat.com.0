Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDD525736F
	for <lists+dm-devel@lfdr.de>; Mon, 31 Aug 2020 07:58:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-Jb6BjWDaNxqP6KBlx26Wfg-1; Mon, 31 Aug 2020 01:58:00 -0400
X-MC-Unique: Jb6BjWDaNxqP6KBlx26Wfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2F0718B9F01;
	Mon, 31 Aug 2020 05:57:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C4595C22A;
	Mon, 31 Aug 2020 05:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00F24A2215;
	Mon, 31 Aug 2020 05:57:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07V5vDMx003362 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 01:57:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D44680546; Mon, 31 Aug 2020 05:57:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0846E7D296
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 05:57:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14900811E7F
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 05:57:07 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-1WOtBBwwMiOwU7JErDGdqw-1; Mon, 31 Aug 2020 01:57:00 -0400
X-MC-Unique: 1WOtBBwwMiOwU7JErDGdqw-1
IronPort-SDR: hJ3j+YYcP/jcriFQdfLvfW6XdXHCUSC4j179umHMMAv8HdqR3W5FnXhhyvPPFe7pvkt08zCnBP
	CrWMfHAZVPStfw3zw8nlNRyJ1Ytm58pA8GTGcn5OtQS/be4buyH+4dUGNgVNawGcFlbJVngXq8
	4dsmI3zVbaWqcy8j5nb0GXx9TkQ1bwEn2LqhxGnz+vixWQ2Asgo8aZTg8YaBziVubWkZZEy1g8
	wo++KkZ+BkGj+4NoPb8A/+3wflqNFfIvwavT/32WkyJWLNIckSAimkbMFK4jcMHwM10S69Q1bE
	G4c=
X-IronPort-AV: E=Sophos;i="5.76,374,1592841600"; d="scan'208";a="146195401"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2020 13:55:57 +0800
IronPort-SDR: oPfE7QDmCE8v3b4j7JRfYiNilzerbAcoRHl19QzvQ35x5Ol7L/fTMzb1WyufDvNN6kfwagruAi
	EI+UEdBVZnqA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	30 Aug 2020 22:43:26 -0700
IronPort-SDR: E/xZainLOI7Q6mU36tLl0Sd/tBQ9pyKcWLbkKqQD2vmA+sg9HjqFRvBa5GEvWwkZC3iPMGjwqj
	hqUJJC0AXKow==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 30 Aug 2020 22:55:55 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon, 31 Aug 2020 14:55:55 +0900
Message-Id: <20200831055555.471935-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm crypt: Initialize crypto wait structures
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the DECLARE_CRYPTO_WAIT() macro to properly initialize the crypto
wait structures declared on stack before their use with
crypto_wait_req().

Fixes: 39d13a1ac41d ("dm crypt: reuse eboiv skcipher for IV generation")
Fixes: bbb1658461ac ("dm crypt: Implement Elephant diffuser for Bitlocker compatibility")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-crypt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 238cd80826a6..380386c36921 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -739,7 +739,7 @@ static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
 	u8 buf[MAX_CIPHER_BLOCKSIZE] __aligned(__alignof__(__le64));
 	struct skcipher_request *req;
 	struct scatterlist src, dst;
-	struct crypto_wait wait;
+	DECLARE_CRYPTO_WAIT(wait);
 	int err;
 
 	req = skcipher_request_alloc(any_tfm(cc), GFP_NOIO);
@@ -936,7 +936,7 @@ static int crypt_iv_elephant(struct crypt_config *cc, struct dm_crypt_request *d
 	u8 *es, *ks, *data, *data2, *data_offset;
 	struct skcipher_request *req;
 	struct scatterlist *sg, *sg2, src, dst;
-	struct crypto_wait wait;
+	DECLARE_CRYPTO_WAIT(wait);
 	int i, r;
 
 	req = skcipher_request_alloc(elephant->tfm, GFP_NOIO);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

