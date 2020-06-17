Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 199541FCECC
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jun 2020 15:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592401754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hv8BEdGERyUa/ka+5jg2EUliVHREzxTeHblntkrwKTg=;
	b=KuTvGHJ6FbWSN7cHr8KpMNGx89wDkE0K4qTZDXH3ysTy0eG/qkIVZnhe8Sz/1bO7r+jmgL
	zM8Ol4WPWMhfcTnX1AEqvf3xvVoXkvhdQp0eS7jum5sbrrg86B/7xEw85qxBxZV+lbRznk
	krYlRUmnDQZqk0DFyED4Y5ySUysW75c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-tHyU_FroPQiVlvAVnxAHRA-1; Wed, 17 Jun 2020 09:49:10 -0400
X-MC-Unique: tHyU_FroPQiVlvAVnxAHRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2F018FE874;
	Wed, 17 Jun 2020 13:49:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 807D419D82;
	Wed, 17 Jun 2020 13:49:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEBFD18095FF;
	Wed, 17 Jun 2020 13:49:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HDn0gv032693 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 09:49:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34BBB5D9E4; Wed, 17 Jun 2020 13:49:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE3F5D9D3;
	Wed, 17 Jun 2020 13:48:57 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05HDmuxK022478; Wed, 17 Jun 2020 09:48:56 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05HDmu3g022474; Wed, 17 Jun 2020 09:48:56 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 17 Jun 2020 09:48:56 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>, George Cherian <gcherian@marvell.com>, 
	Wei Xu <xuwei5@hisilicon.com>, Zaibo Xu <xuzaibo@huawei.com>
In-Reply-To: <alpine.LRH.2.02.2006170940510.18714@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2006170946590.18714@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161102250.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616175022.GD207319@gmail.com>
	<alpine.LRH.2.02.2006161416510.12390@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616182327.GE207319@gmail.com>
	<alpine.LRH.2.02.2006170940510.18714@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Milan Broz <mbroz@redhat.com>
Subject: [dm-devel] [PATCH 1/2] cpt-crypto: don't sleep of
 CRYPTO_TFM_REQ_MAY_SLEEP was not specified
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is this call chain:
cvm_encrypt -> cvm_enc_dec -> cptvf_do_request -> process_request -> kzalloc
where we call sleeping allocator function even if CRYPTO_TFM_REQ_MAY_SLEEP 
was not specified.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v4.11+
Fixes: c694b233295b ("crypto: cavium - Add the Virtual Function driver for CPT")

---
 drivers/crypto/cavium/cpt/cptvf_algs.c       |    1 +
 drivers/crypto/cavium/cpt/cptvf_reqmanager.c |   12 ++++++------
 drivers/crypto/cavium/cpt/request_manager.h  |    2 ++
 3 files changed, 9 insertions(+), 6 deletions(-)

Index: linux-2.6/drivers/crypto/cavium/cpt/cptvf_algs.c
===================================================================
--- linux-2.6.orig/drivers/crypto/cavium/cpt/cptvf_algs.c
+++ linux-2.6/drivers/crypto/cavium/cpt/cptvf_algs.c
@@ -200,6 +200,7 @@ static inline int cvm_enc_dec(struct skc
 	int status;
 
 	memset(req_info, 0, sizeof(struct cpt_request_info));
+	req_info->may_sleep = (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) != 0;
 	memset(fctx, 0, sizeof(struct fc_context));
 	create_input_list(req, enc, enc_iv_len);
 	create_output_list(req, enc_iv_len);
Index: linux-2.6/drivers/crypto/cavium/cpt/cptvf_reqmanager.c
===================================================================
--- linux-2.6.orig/drivers/crypto/cavium/cpt/cptvf_reqmanager.c
+++ linux-2.6/drivers/crypto/cavium/cpt/cptvf_reqmanager.c
@@ -133,7 +133,7 @@ static inline int setup_sgio_list(struct
 
 	/* Setup gather (input) components */
 	g_sz_bytes = ((req->incnt + 3) / 4) * sizeof(struct sglist_component);
-	info->gather_components = kzalloc(g_sz_bytes, GFP_KERNEL);
+	info->gather_components = kzalloc(g_sz_bytes, req->may_sleep ? GFP_KERNEL : GFP_ATOMIC);
 	if (!info->gather_components) {
 		ret = -ENOMEM;
 		goto  scatter_gather_clean;
@@ -150,7 +150,7 @@ static inline int setup_sgio_list(struct
 
 	/* Setup scatter (output) components */
 	s_sz_bytes = ((req->outcnt + 3) / 4) * sizeof(struct sglist_component);
-	info->scatter_components = kzalloc(s_sz_bytes, GFP_KERNEL);
+	info->scatter_components = kzalloc(s_sz_bytes, req->may_sleep ? GFP_KERNEL : GFP_ATOMIC);
 	if (!info->scatter_components) {
 		ret = -ENOMEM;
 		goto  scatter_gather_clean;
@@ -167,7 +167,7 @@ static inline int setup_sgio_list(struct
 
 	/* Create and initialize DPTR */
 	info->dlen = g_sz_bytes + s_sz_bytes + SG_LIST_HDR_SIZE;
-	info->in_buffer = kzalloc(info->dlen, GFP_KERNEL);
+	info->in_buffer = kzalloc(info->dlen, req->may_sleep ? GFP_KERNEL : GFP_ATOMIC);
 	if (!info->in_buffer) {
 		ret = -ENOMEM;
 		goto  scatter_gather_clean;
@@ -195,7 +195,7 @@ static inline int setup_sgio_list(struct
 	}
 
 	/* Create and initialize RPTR */
-	info->out_buffer = kzalloc(COMPLETION_CODE_SIZE, GFP_KERNEL);
+	info->out_buffer = kzalloc(COMPLETION_CODE_SIZE, req->may_sleep ? GFP_KERNEL : GFP_ATOMIC);
 	if (!info->out_buffer) {
 		ret = -ENOMEM;
 		goto scatter_gather_clean;
@@ -421,7 +421,7 @@ int process_request(struct cpt_vf *cptvf
 	struct cpt_vq_command vq_cmd;
 	union cpt_inst_s cptinst;
 
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), req->may_sleep ? GFP_KERNEL : GFP_ATOMIC);
 	if (unlikely(!info)) {
 		dev_err(&pdev->dev, "Unable to allocate memory for info_buffer\n");
 		return -ENOMEM;
@@ -443,7 +443,7 @@ int process_request(struct cpt_vf *cptvf
 	 * Get buffer for union cpt_res_s response
 	 * structure and its physical address
 	 */
-	info->completion_addr = kzalloc(sizeof(union cpt_res_s), GFP_KERNEL);
+	info->completion_addr = kzalloc(sizeof(union cpt_res_s), req->may_sleep ? GFP_KERNEL : GFP_ATOMIC);
 	if (unlikely(!info->completion_addr)) {
 		dev_err(&pdev->dev, "Unable to allocate memory for completion_addr\n");
 		ret = -ENOMEM;
Index: linux-2.6/drivers/crypto/cavium/cpt/request_manager.h
===================================================================
--- linux-2.6.orig/drivers/crypto/cavium/cpt/request_manager.h
+++ linux-2.6/drivers/crypto/cavium/cpt/request_manager.h
@@ -62,6 +62,8 @@ struct cpt_request_info {
 	union ctrl_info ctrl; /* User control information */
 	struct cptvf_request req; /* Request Information (Core specific) */
 
+	bool may_sleep;
+
 	struct buf_ptr in[MAX_BUF_CNT];
 	struct buf_ptr out[MAX_BUF_CNT];
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

