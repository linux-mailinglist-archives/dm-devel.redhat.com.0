Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC668B9FD
	for <lists+dm-devel@lfdr.de>; Mon,  6 Feb 2023 11:23:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675679008;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nKGkG3HVjpiTDA5fOx7+nYRxb0r1AV/cpGQ1cUQ5SDE=;
	b=Q9IDxv0p10RN1sPFQSZSkq5xEEP/Fi2HRzSxukE3lVyx4yckYA5vzNst/M4iW0wWKya9Ue
	1J+fK/1qOcSr3QahonaWYGQFnhq1cQ2ljsXRCCe+9w5WqwVCOea6h9nu7/i1Hy2GlRrEnV
	vrQOspg6OhesiZ7FhsVcvTTm9ZmnpQA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-G3kc4rxKP0Si0VpW7SqCcA-1; Mon, 06 Feb 2023 05:23:24 -0500
X-MC-Unique: G3kc4rxKP0Si0VpW7SqCcA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AE643C0D841;
	Mon,  6 Feb 2023 10:23:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33515492B23;
	Mon,  6 Feb 2023 10:23:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1BAA9194658C;
	Mon,  6 Feb 2023 10:23:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9277719465A8
 for <dm-devel@listman.corp.redhat.com>; Mon,  6 Feb 2023 10:23:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 884272166B30; Mon,  6 Feb 2023 10:23:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from formenos.hmeau.com (unknown [10.67.24.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C7592166B2A;
 Mon,  6 Feb 2023 10:23:19 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pOye4-007zka-Fr; Mon, 06 Feb 2023 18:22:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 06 Feb 2023 18:22:44 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Mon, 06 Feb 2023 18:22:44 +0800
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
Message-Id: <E1pOye4-007zka-Fr@formenos.hmeau.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH 16/17] tls: Remove completion function scaffolding
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch removes the temporary scaffolding now that the comletion
function signature has been converted.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 net/tls/tls_sw.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 5b7f67a7d394..0515cda32fe2 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -179,9 +179,9 @@ static int tls_padding_length(struct tls_prot_info *prot, struct sk_buff *skb,
 	return sub;
 }
 
-static void tls_decrypt_done(crypto_completion_data_t *data, int err)
+static void tls_decrypt_done(void *data, int err)
 {
-	struct aead_request *aead_req = crypto_get_completion_data(data);
+	struct aead_request *aead_req = data;
 	struct crypto_aead *aead = crypto_aead_reqtfm(aead_req);
 	struct scatterlist *sgout = aead_req->dst;
 	struct scatterlist *sgin = aead_req->src;
@@ -428,9 +428,9 @@ int tls_tx_records(struct sock *sk, int flags)
 	return rc;
 }
 
-static void tls_encrypt_done(crypto_completion_data_t *data, int err)
+static void tls_encrypt_done(void *data, int err)
 {
-	struct aead_request *aead_req = crypto_get_completion_data(data);
+	struct aead_request *aead_req = data;
 	struct tls_sw_context_tx *ctx;
 	struct tls_context *tls_ctx;
 	struct tls_prot_info *prot;
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

