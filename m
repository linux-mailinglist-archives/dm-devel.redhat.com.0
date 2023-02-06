Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9459468BA04
	for <lists+dm-devel@lfdr.de>; Mon,  6 Feb 2023 11:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675679047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RyhRY6BxUGq1EGUA13jqie7DyMDinXJtegw1tIQ+KRs=;
	b=Al4epyqamKXOptJMV9xoTwudwhPDLapCo15dGhuxh819zK77dJzwi6fC35Z/pzYG2w0Sp+
	bOWx/ERlGXGCN2nDUnOqRirdB96grW3X73+RIjN2dvEUBM7BJeegYM9qE9VF/IVAEMDf50
	P+U20RMmivrWGhHQTEZH09/b2r8g7+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-661Ob-RyOfGlw7nTMi5syw-1; Mon, 06 Feb 2023 05:23:12 -0500
X-MC-Unique: 661Ob-RyOfGlw7nTMi5syw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FDB2100F90F;
	Mon,  6 Feb 2023 10:23:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 26062440E1;
	Mon,  6 Feb 2023 10:23:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E927919465A0;
	Mon,  6 Feb 2023 10:23:07 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B1B51946594
 for <dm-devel@listman.corp.redhat.com>; Mon,  6 Feb 2023 10:23:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B3C92026E1F; Mon,  6 Feb 2023 10:23:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from formenos.hmeau.com (unknown [10.67.24.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F12082026D37;
 Mon,  6 Feb 2023 10:23:03 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pOydl-007zhn-Io; Mon, 06 Feb 2023 18:22:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 18:22:25 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Mon, 06 Feb 2023 18:22:25 +0800
References: <Y+DUkqe1sagWaErA@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Tyler Hicks <code@tyhicks.com>, ecryptfs@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org,
 Steffen Klassert <steffen.klassert@secunet.com>, Jon Maloy <jmaloy@redhat.com>,
 Ying Xue <ying.xue@windriver.com>, Boris Pismenny <borisp@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org
Message-Id: <E1pOydl-007zhn-Io@formenos.hmeau.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH 7/17] tipc: Add scaffolding to change completion
 function signature
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
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds temporary scaffolding so that the Crypto API
completion function can take a void * instead of crypto_async_request.
Once affected users have been converted this can be removed.
    
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 net/tipc/crypto.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index d67440de011e..ab356e7a3870 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -267,10 +267,10 @@ static int tipc_aead_encrypt(struct tipc_aead *aead, struct sk_buff *skb,
 			     struct tipc_bearer *b,
 			     struct tipc_media_addr *dst,
 			     struct tipc_node *__dnode);
-static void tipc_aead_encrypt_done(struct crypto_async_request *base, int err);
+static void tipc_aead_encrypt_done(crypto_completion_data_t *data, int err);
 static int tipc_aead_decrypt(struct net *net, struct tipc_aead *aead,
 			     struct sk_buff *skb, struct tipc_bearer *b);
-static void tipc_aead_decrypt_done(struct crypto_async_request *base, int err);
+static void tipc_aead_decrypt_done(crypto_completion_data_t *data, int err);
 static inline int tipc_ehdr_size(struct tipc_ehdr *ehdr);
 static int tipc_ehdr_build(struct net *net, struct tipc_aead *aead,
 			   u8 tx_key, struct sk_buff *skb,
@@ -830,9 +830,9 @@ static int tipc_aead_encrypt(struct tipc_aead *aead, struct sk_buff *skb,
 	return rc;
 }
 
-static void tipc_aead_encrypt_done(struct crypto_async_request *base, int err)
+static void tipc_aead_encrypt_done(crypto_completion_data_t *data, int err)
 {
-	struct sk_buff *skb = base->data;
+	struct sk_buff *skb = crypto_get_completion_data(data);
 	struct tipc_crypto_tx_ctx *tx_ctx = TIPC_SKB_CB(skb)->crypto_ctx;
 	struct tipc_bearer *b = tx_ctx->bearer;
 	struct tipc_aead *aead = tx_ctx->aead;
@@ -954,9 +954,9 @@ static int tipc_aead_decrypt(struct net *net, struct tipc_aead *aead,
 	return rc;
 }
 
-static void tipc_aead_decrypt_done(struct crypto_async_request *base, int err)
+static void tipc_aead_decrypt_done(crypto_completion_data_t *data, int err)
 {
-	struct sk_buff *skb = base->data;
+	struct sk_buff *skb = crypto_get_completion_data(data);
 	struct tipc_crypto_rx_ctx *rx_ctx = TIPC_SKB_CB(skb)->crypto_ctx;
 	struct tipc_bearer *b = rx_ctx->bearer;
 	struct tipc_aead *aead = rx_ctx->aead;
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

