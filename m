Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B4B8833CBEF
	for <lists+dm-devel@lfdr.de>; Tue, 16 Mar 2021 04:19:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615864761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AAivrgbs8+NOQ08tQkaS6T1vORdaFOPPBYrGurAfoEo=;
	b=gQuOaIQTGBRgEqc9svJn0FDtLVkASZxQ/yERomOwsEAGXgHQfZWQLQiqXXPPFASZ0rp0uH
	bQTsjVqAEwvjgsUXXxeg+puI8HATRn0ItaxzODx3vxKcxxZ+um9NRoFHOv2Vmzht2R/vLT
	7IZWFSM3VYYTYHwZnZ8/lb2wop4LcPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-YGJPzuimM0Saf3p_x9gixw-1; Mon, 15 Mar 2021 23:19:19 -0400
X-MC-Unique: YGJPzuimM0Saf3p_x9gixw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41B4E56BF6;
	Tue, 16 Mar 2021 03:19:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12E521F04A;
	Tue, 16 Mar 2021 03:19:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC81E18095C9;
	Tue, 16 Mar 2021 03:18:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12G3IZGc002793 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 23:18:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDEDB1F053; Tue, 16 Mar 2021 03:18:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-86.pek2.redhat.com [10.72.12.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9056E1F04A;
	Tue, 16 Mar 2021 03:18:24 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 16 Mar 2021 11:15:18 +0800
Message-Id: <20210316031523.864506-7-ming.lei@redhat.com>
In-Reply-To: <20210316031523.864506-1-ming.lei@redhat.com>
References: <20210316031523.864506-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH 06/11] block: add new field into 'struct
	bvec_iter'
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a hole at the end of 'struct bvec_iter', so put a new field
here and we can save cookie returned from submit_bio() here for
supporting bio based polling.

This way can avoid to extend bio unnecessarily.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 include/linux/bvec.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index ff832e698efb..61c0f55f7165 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -43,6 +43,15 @@ struct bvec_iter {
 
 	unsigned int            bi_bvec_done;	/* number of bytes completed in
 						   current bvec */
+
+	/*
+	 * There is a hole at the end of bvec_iter, define one filed to
+	 * hold something which isn't relate with 'bvec_iter', so that we can
+	 * avoid to extend bio. So far this new field is used for bio based
+	 * pooling, we will store returning value of underlying queue's
+	 * submit_bio() here.
+	 */
+	unsigned int		bi_private_data;
 };
 
 struct bvec_iter_all {
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

